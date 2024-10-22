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
main = { init, render }

Model : {
    screen : [Playing, Paused],
    player : Player,
    spriteSheet : Texture,
    timestampMillis : U64,
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

windowWidth = 800
windowHeight = 600

init : Task Model _
init =
    RocRay.setTargetFPS! 60
    RocRay.setWindowSize! { width: windowWidth, height: windowHeight }
    RocRay.setWindowTitle! "Platformer Example"

    RocRay.setDrawFPS! { fps: Visible }

    spriteSheet = Sprites.load!

    model : Model
    model = newGame { spriteSheet }

    Task.ok model

newGame : { spriteSheet : Texture } -> Model
newGame = \{ spriteSheet } -> {
    screen: Playing,
    timestampMillis: 0,
    spriteSheet,
    player: {
        x: windowWidth / 2.0,
        y: windowHeight / 2.0,
        intent: Idle Right,
        animation: Standing 0,
    },
}

blueGreenGray = RGBA 240 255 245 255

render : Model, PlatformState -> Task Model _
render = \model, state ->
    newModel = update! model state
    draw! newModel
    Task.ok newModel

draw : Model -> Task {} _
draw = \model ->
    RocRay.beginDrawing! blueGreenGray
    drawBackground! model
    drawPlayer! model
    RocRay.endDrawing!

drawBackground : Model -> Task {} _
drawBackground = \{ spriteSheet } ->
    signPos = {
        x: windowWidth / 2.0 + 60.0,
        y: windowHeight / 2.0 - 20.0,
    }
    drawSprite! {
        sprite: Sprites.signArrow,
        tint: blueGreenGray,
        pos: signPos,
        spriteSheet,
    }

    RocRay.drawText! {
        text: "press enter to pause",
        pos: { x: 200, y: 200 },
        size: 20,
        color: Black,
    }

    tileHeight = Sprites.tileGreen01.height
    tileWidth = Sprites.tileGreen01.width

    topLeft = Sprites.tileGreen04
    topMid = Sprites.tileGreen05
    # topRight = Sprites.tileGreen06
    internalGround = Sprites.tileGreen03

    groundRow = List.prepend (List.repeat topMid 12) topLeft
    internalRow = List.repeat internalGround 13
    rows = List.prepend (List.repeat internalRow 4) groundRow

    indexedRows = List.mapWithIndex rows \row, r -> (row, r)
    Task.forEach indexedRows \(row, r) ->
        indexedTiles = List.mapWithIndex row \sprite, i -> (sprite, i)
        Task.forEach indexedTiles \(sprite, i) ->
            x = tileWidth * Num.toF32 i
            y = windowWidth / 2.0 - tileHeight + tileHeight * Num.toF32 r
            drawSprite! { pos: { x, y }, tint: White, sprite, spriteSheet }

update : Model, PlatformState -> Task Model _
update = \model, state ->
    timestampMillis = state.timestampMillis
    deltaMillis = timestampMillis - model.timestampMillis
    deltaTime = Num.toF32 deltaMillis

    intent = readInput! model.player state

    xMove =
        when intent is
            Walk Right -> 1.0
            Walk Left -> -1.0
            Idle _facing -> 0.0
    runSpeed = 0.5

    animation =
        when (intent, model.player.animation) is
            (Idle _facing, Standing millis) -> Standing (millis + deltaMillis)
            (Idle _facing, _other) -> Standing 0
            (Walk _facing, Walking millis) -> Walking (millis + deltaMillis)
            (Walk _facing, _other) -> Walking 0

    oldPlayer = model.player
    newPlayer = { oldPlayer &
        intent,
        animation,
        x: oldPlayer.x + xMove * runSpeed * deltaTime,
    }

    Task.ok { model & player: newPlayer, timestampMillis }

readInput : Player, PlatformState -> Task Intent _
readInput = \player, { keys } ->
    left = if Keys.anyDown keys [KeyLeft, KeyA] then Down else Up
    right = if Keys.anyDown keys [KeyRight, KeyD] then Down else Up

    intent =
        when (left, right) is
            (Down, Up) -> Walk Left
            (Up, Down) -> Walk Right
            _same -> Idle (playerFacing player)

    Task.ok intent

drawPlayer : Model -> Task {} _
drawPlayer = \model ->
    flipFacing = \rect ->
        when playerFacing model.player is
            Right -> rect
            Left -> { rect & width: -rect.width }

    sprite : Sprite
    sprite =
        model.player.animation
        |> animationFrame
        |> flipFacing

    pos = { x: model.player.x, y: model.player.y }

    drawSprite { sprite, pos, spriteSheet: model.spriteSheet, tint: White }

drawSprite : { sprite : Sprite, spriteSheet : Texture, pos : Vector2, tint : Color } -> Task {} _
drawSprite = \{ sprite, spriteSheet, pos, tint } ->
    source = Sprites.rect sprite
    texture = spriteSheet
    RocRay.drawTextureRec { source, texture, pos, tint }

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

# level = [
#     List.repeat Sky 8,
#     List.repeat Sky 8,
#     List.repeat Sky 8,
#     List.repeat Green 8,
#     List.repeat Green 8,
#     List.repeat Green 8,
# ]
