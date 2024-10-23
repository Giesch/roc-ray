app [main, Model] {
    ray: platform "../../platform/main.roc",
}

import ray.RocRay exposing [PlatformState, Texture, Vector2, Color]
import ray.Keys

import Generated.Sprites as Sprites exposing [Sprite]

### TODO
###
### add a camera & background
### make a level (code only)
### start porting physics
###
### audio (music?)
### web build?
### level editor (in pause screen?)

main : RocRay.Program Model _
main = { init!, render! }

Model : {
    screen : [Playing, Paused],
    player : Player,
    spriteSheet : Texture,
    level : Level,
    timestampMillis : U64,
    windowWidth : F32,
    windowHeight : F32,
}

Player : {
    x : F32,
    y : F32,
    intent : Intent,
    animation : Animation,
}

Facing : [Right, Left]
Intent : [Idle Facing, Walk Facing]

Animation : [
    Standing U64,
    Walking U64,
]

tileSize = 64

init! : {} => Result Model _
init! = \{} ->
    RocRay.setTargetFPS! 60

    RocRay.setDrawFPS! { fps: Visible }

    spriteSheet = Sprites.load! {}
    level = loadLevel! {}
    windowWidth = 12 * tileSize
    windowHeight = 10 * tileSize

    RocRay.setWindowSize! { width: windowWidth, height: windowHeight }
    RocRay.setWindowTitle! "Platformer Example"

    model = newGame { spriteSheet, level, windowWidth, windowHeight }

    Ok model

newGame : { spriteSheet : Texture, level : Level, windowWidth : F32, windowHeight : F32 } -> Model
newGame = \{ spriteSheet, level, windowWidth, windowHeight } ->
    # TODO get this out of the level
    playerX = Num.toF32 (3 * tileSize)
    playerY = Num.toF32 (5 * tileSize) - Sprites.playerGreenStand.height

    {
        screen: Playing,
        timestampMillis: 0,
        spriteSheet,
        level,
        player: {
            x: playerX,
            y: playerY,
            intent: Idle Right,
            animation: Standing 0,
        },
        windowWidth,
        windowHeight,
    }

blueGreenGray = RGBA 240 255 245 255

render! : Model, PlatformState => Result Model []
render! = \model, state ->
    newModel = update! model state
    draw! newModel
    Ok newModel

draw! : Model => {}
draw! = \model ->
    RocRay.beginDrawing! blueGreenGray
    drawLevel! model
    drawPlayer! model
    RocRay.endDrawing! {}

drawLevel! : Model => {}
drawLevel! = \{ spriteSheet, level } ->
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

    forEach! gridSpritesToDraw drawSprite!

update! : Model, PlatformState => Model
update! = \model, state ->
    timestampMillis = state.timestampMillis
    deltaMillis = timestampMillis - model.timestampMillis
    deltaTime = Num.toF32 deltaMillis

    intent = readInput! model.player state

    xMove =
        when intent is
            Walk Right -> 1.0
            Walk Left -> -1.0
            Idle _facing -> 0.0

    animation =
        when (intent, model.player.animation) is
            (Idle _facing, Standing millis) -> Standing (millis + deltaMillis)
            (Idle _facing, _other) -> Standing 0
            (Walk _facing, Walking millis) -> Walking (millis + deltaMillis)
            (Walk _facing, _other) -> Walking 0

    newPlayer =
        oldPlayer = model.player
        runSpeed = 0.5
        x = oldPlayer.x + xMove * runSpeed * deltaTime
        { oldPlayer & intent, animation, x }

    { model & player: newPlayer, timestampMillis }

readInput! : Player, PlatformState => Intent
readInput! = \player, { keys } ->
    left = if Keys.anyDown keys [KeyLeft, KeyA] then Down else Up
    right = if Keys.anyDown keys [KeyRight, KeyD] then Down else Up

    intent =
        when (left, right) is
            (Down, Up) -> Walk Left
            (Up, Down) -> Walk Right
            _same -> Idle (playerFacing player)

    intent

drawPlayer! : Model => {}
drawPlayer! = \model ->
    withFacing = \rect ->
        when playerFacing model.player is
            Right -> rect
            Left -> { rect & width: -rect.width }

    sprite : Sprite
    sprite =
        model.player.animation
        |> animationFrame
        |> withFacing

    pos = { x: model.player.x, y: model.player.y }

    drawSprite! { sprite, pos, spriteSheet: model.spriteSheet, tint: White }

# TODO remove this?
drawSprite! : { sprite : Sprite, spriteSheet : Texture, pos : Vector2, tint : Color } => {}
drawSprite! = \{ sprite, spriteSheet, pos, tint } ->
    RocRay.drawTextureRec! { source: sprite, texture: spriteSheet, pos, tint }

playerFacing : Player -> Facing
playerFacing = \player ->
    when player.intent is
        Idle facing -> facing
        Walk facing -> facing

### ANIMATION

animationFrame : Animation -> Sprite
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

    offset = totalElapsed % totalDuration

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

loadLevel! : {} => Level
loadLevel! = \{} ->
    toTile : U8 -> Tile
    toTile = \ch ->
        when ch is
            'P' -> PlayerStart
            'S' -> BlankSky
            '4' -> Green4
            '5' -> Green5
            '3' -> Green3
            c -> crash "unrecognized character: $(Inspect.toStr c)"

    text = RocRay.readFileToStr! "examples/assets/platformer/level.txt"
    lines = Str.split text "\n"
    rows = List.map lines \line ->
        bytes = Str.toUtf8 line
        List.map bytes toTile

    rows

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

forEach! : List a, (a => {}) => {}
forEach! = \list, do! ->
    when list is
        [] -> {}
        [x, .. as xs] ->
            do! x
            forEach! xs do!
