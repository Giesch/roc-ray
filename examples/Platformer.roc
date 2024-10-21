app [main, Model] {
    ray: platform "../platform/main.roc",
}

import ray.RocRay exposing [PlatformState, Texture, Rectangle]
import ray.RocRay.Keys as Keys

import Platformer.Generated.Sprites as Sprites exposing [Sprite]

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
    spriteSheet : Texture,
    player : Player,
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

    spriteSheet = Sprites.load!

    model : Model
    model = {
        spriteSheet,
        player: {
            x: windowWidth / 2.0,
            y: windowHeight / 2.0,
            intent: Idle Right,
            animation: Standing 0,
        },
        timestampMillis: 0,
    }

    Task.ok model

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
drawBackground = \model ->
    signPos = {
        x: windowWidth / 2.0 + 60.0,
        y: windowHeight / 2.0 - Num.toF32 Sprites.signArrow.height,
    }
    RocRay.drawTextureRec! {
        source: Sprites.rect Sprites.signArrow,
        tint: blueGreenGray,
        pos: signPos,
        texture: model.spriteSheet,
    }

    tileHeight = Sprites.tileGreen01.height
    tileWidth = Sprites.tileGreen01.width

    internalGround = Sprites.tileGreen03
    # topRight = Sprites.tileGreen06
    topMid = Sprites.tileGreen05
    topLeft = Sprites.tileGreen04

    groundRow = List.prepend (List.repeat topMid 12) topLeft
    internalRow = List.repeat internalGround 13
    rows = List.prepend (List.repeat internalRow 4) groundRow

    indexedRows = List.mapWithIndex rows \row, r -> (row, r)
    Task.forEach indexedRows \(row, r) ->
        indexedTiles = List.mapWithIndex row \tile, i -> (tile, i)
        Task.forEach indexedTiles \(tile, i) ->
            x = tileWidth * Num.toF32 i
            y = windowWidth / 2.0 - tileHeight + tileHeight * Num.toF32 r

            RocRay.drawTextureRec {
                pos: { x, y },
                source: Sprites.rect tile,
                tint: White,
                texture: model.spriteSheet,
            }

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
    newPlayer =
        if Keys.anyDown keys [KeyLeft, KeyA] then
            Walk Left
        else if Keys.anyDown keys [KeyRight, KeyD] then
            Walk Right
        else
            Idle (playerFacing player)

    Task.ok newPlayer

drawPlayer : Model -> Task {} _
drawPlayer = \model ->
    flipFacing = \rect ->
        when playerFacing model.player is
            Right -> rect
            Left -> { rect & width: -rect.width }

    sprite = animationFrame model.player.animation

    source : Rectangle
    source =
        sprite
        |> Sprites.rect
        |> flipFacing

    texture = model.spriteSheet
    pos = { x: model.player.x, y: model.player.y }
    tint = White
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
    (Sprites.playerGreenwalk1, 100),
    (Sprites.playerGreenwalk2, 100),
    (Sprites.playerGreenwalk3, 100),
    (Sprites.playerGreenwalk2, 100),
]

idlingLoop : List AnimationStep
idlingLoop = [
    (Sprites.playerGreenwalk1, 4_000),
    (Sprites.playerGreenstand, 2_000),
    (Sprites.playerGreenwalk1, 4_000),
    (Sprites.playerGreenup1, 2_000),
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

