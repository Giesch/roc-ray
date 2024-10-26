app [init, render, Model] { rr: platform "../../platform/main.roc" }

import rr.RocRay exposing [PlatformState, Texture, Vector2, Color]
import rr.Draw
import World exposing [World]

import Generated.Sprites as Sprites exposing [Sprite]

### TODO
###
### add a camera & background
### start porting physics
###
### audio (music?)
### web build?
### level editor (in pause screen?)

Model : {
    screen : [Playing, Paused],
    spriteSheet : Texture,
    level : Level,
    world : World,
    # TODO give init a timestamp from the platform
    timestampMillis : [FirstFrame, Timestamp U64],
    windowWidth : F32,
    windowHeight : F32,
}

tileSize = 64

init : Task Model _
init =
    windowWidth = 12 * tileSize
    windowHeight = 10 * tileSize

    RocRay.initWindow! {
        title: "Platformer Example",
        width: windowWidth,
        height: windowHeight,
    }

    RocRay.setTargetFPS! 60

    RocRay.setDrawFPS! { fps: Visible }

    spriteSheet = Sprites.load!
    level = loadLevel!

    model = newGame { spriteSheet, level, windowWidth, windowHeight }

    Task.ok model

newGame :
    { spriteSheet : Texture, level : Level, windowWidth : F32, windowHeight : F32 }
    -> Model
newGame = \{ spriteSheet, level, windowWidth, windowHeight } ->
    # TODO get this out of the level
    playerX = Num.toF32 (3 * tileSize)
    playerY = Num.toF32 (5 * tileSize) - Sprites.playerGreenStand.height

    player = {
        x: playerX,
        y: playerY,
        intent: Idle Right,
        animation: Standing 0,
    }

    world = World.new player

    {
        screen: Playing,
        timestampMillis: FirstFrame,
        spriteSheet,
        level,
        world,
        windowWidth,
        windowHeight,
    }

blueGreenGray = RGBA 240 255 245 255

render : Model, PlatformState -> Task Model _
render = \model, state ->
    newModel = update! model state
    draw! newModel
    Task.ok newModel

draw : Model -> Task {} _
draw = \model ->
    Draw.draw! blueGreenGray \{} ->
        drawLevel! model
        drawPlayer! model

drawLevel : Model -> Task {} _
drawLevel = \{ spriteSheet, level } ->
    drawTileSpriteArgs : { sprite : Sprite, r : U64, c : U64 } -> _
    drawTileSpriteArgs = \{ sprite, r, c } ->
        x = Num.toF32 (tileSize * c)
        y = Num.toF32 (tileSize * r)
        { sprite, spriteSheet, tint: blueGreenGray, pos: { x, y } }

    grid : List (List _)
    grid =
        List.mapWithIndex level \row, r ->
            List.mapWithIndex row \tile, c ->
                Result.map (spriteForTile tile) \sprite ->
                    drawTileSpriteArgs { sprite, r, c }

    gridSpritesToDraw =
        grid
        |> List.join
        |> List.keepOks \id -> id

    Task.forEach! gridSpritesToDraw drawSprite

update : Model, PlatformState -> Task Model _
update = \model, state ->
    timestampMillis = state.timestampMillis
    deltaMillis =
        when model.timestampMillis is
            FirstFrame -> 0
            Timestamp t -> timestampMillis - t

    world = World.frameTick model.world state (Num.toF32 deltaMillis)

    Task.ok { model & world, timestampMillis: Timestamp timestampMillis }

drawPlayer : Model -> Task {} _
drawPlayer = \model ->
    withFacing = \rect ->
        when World.playerFacing model.world.player is
            Right -> rect
            Left -> { rect & width: -rect.width }

    player = model.world.player

    sprite : Sprite
    sprite =
        player.animation
        |> animationFrame
        |> withFacing

    pos = { x: player.x, y: player.y }

    drawSprite { sprite, pos, spriteSheet: model.spriteSheet, tint: White }

drawSprite : { sprite : Sprite, spriteSheet : Texture, pos : Vector2, tint : Color } -> Task {} _
drawSprite = \{ sprite, spriteSheet, pos, tint } ->
    Draw.textureRec { source: sprite, texture: spriteSheet, pos, tint }

### ANIMATION

animationFrame : World.Animation -> Sprite
animationFrame = \animation ->
    totalDuration : U64
    totalDuration =
        steps
        |> List.map (\(_sprite, duration) -> duration)
        |> List.sum

    (totalElapsed, steps) =
        when animation is
            Standing elapsed -> (elapsed, idlingLoop)
            Walking elapsed -> (elapsed, walkingLoop)

    offset = (Num.floor totalElapsed) % totalDuration

    (_elapsed, chosenSprite) =
        List.walkUntil steps (0, Err None) \(elapsed, _lastSprite), (nextSprite, duration) ->
            nextElapsed = elapsed + duration
            next = (nextElapsed, Ok nextSprite)
            if nextElapsed >= offset then
                Break next
            else
                Continue next

    when chosenSprite is
        Ok sprite -> sprite
        Err None -> crash "bug in sprite animation steps"

# sprite and duration in milliseconds
AnimationStep : (Sprite, U64)

walkingLoop : List AnimationStep
walkingLoop = [
    (Sprites.playerGreenWalk1, 100),
    (Sprites.playerGreenWalk2, 100),
    (Sprites.playerGreenWalk3, 100),
    (Sprites.playerGreenWalk2, 100),
]

idlingLoop : List AnimationStep
idlingLoop = [
    (Sprites.playerGreenWalk1, 4_000),
    (Sprites.playerGreenStand, 2_000),
    (Sprites.playerGreenWalk1, 4_000),
    (Sprites.playerGreenUp1, 2_000),
]

### LEVEL

loadLevel : Task Level _
loadLevel =
    toTile : U8 -> Tile
    toTile = \ch ->
        when ch is
            'P' -> PlayerStart
            'S' -> BlankSky
            '4' -> Green4
            '5' -> Green5
            '3' -> Green3
            c -> crash "unrecognized character: $(Inspect.toStr c)"

    text = RocRay.loadFileToStr! "examples/assets/platformer/level.txt"
    lines = Str.split text "\n"
    rows = List.map lines \line ->
        bytes = Str.toUtf8 line
        List.map bytes toTile

    Task.ok rows

Level : List (List Tile)
Tile : [
    PlayerStart,
    BlankSky,
    Green4,
    Green5,
    Green3,
]

spriteForTile : Tile -> Result Sprite [None]
spriteForTile = \tile ->
    when tile is
        PlayerStart -> Err None
        BlankSky -> Err None
        Green4 -> Ok Sprites.tileGreen04
        Green5 -> Ok Sprites.tileGreen05
        Green3 -> Ok Sprites.tileGreen03
