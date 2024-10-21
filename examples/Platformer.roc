app [main, Model] {
    ray: platform "../platform/main.roc",
}

import ray.RocRay exposing [PlatformState, Texture, Rectangle]
import ray.RocRay.Keys as Keys

import Platformer.Generated.SpriteAtlas as SpriteAtlas exposing [Sprite]

main : RocRay.Program Model _
main = { init, render }

Model : {
    spriteSheet : Texture,
    sprites : Sprites,
    player : Player,
    timestampMillis : U64,
}

Sprites : {
    walk : List Sprite,
    stand : List Sprite,
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
    RocRay.setBackgroundColor! White

    spriteSheet = SpriteAtlas.load!

    stand : List Sprite
    stand = [
        SpriteAtlas.playerGreenwalk1,
        SpriteAtlas.playerGreenstand,
        SpriteAtlas.playerGreenup1,
    ]

    walk : List Sprite
    walk = [
        SpriteAtlas.playerGreenwalk1,
        SpriteAtlas.playerGreenwalk2,
        SpriteAtlas.playerGreenwalk3,
    ]

    sprites : Sprites
    sprites = { walk, stand }

    model : Model
    model = {
        spriteSheet,
        player: {
            x: windowWidth / 2.0,
            y: windowHeight / 2.0,
            intent: Idle Right,
            animation: Standing 0,
        },
        sprites,
        timestampMillis: 0,
    }

    Task.ok model

render : Model, PlatformState -> Task Model _
render = \model, state ->
    newModel = update! model state
    drawPlayer! newModel
    Task.ok newModel

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

    sprite = animate model.player.animation

    source : Rectangle
    source =
        sprite
        |> minusName
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

minusName : Sprite -> Rectangle
minusName = \{ x, y, width, height } -> { x, y, width, height }

# ANIMATION

animate : Animation -> Sprite
animate = \animation ->
    totalDuration : U64
    totalDuration =
        steps
        |> List.map (\(_sprite, duration) -> duration)
        |> List.sum

    (totalElapsed, steps) =
        when animation is
            Standing elapsed -> (elapsed, idlingAnimation)
            Walking elapsed -> (elapsed, walkingAnimation)

    offset = totalElapsed % totalDuration

    (_elapsed, chosenSprite) =
        List.walkUntil steps (0, Err None) \(timeSpent, _lastSprite), (nextSprite, duration) ->
            time = timeSpent + duration
            newState = (time, Ok nextSprite)
            if time >= offset then
                Break newState
            else
                Continue newState

    when chosenSprite is
        Ok sprite -> sprite
        Err _ -> crash "bug in sprite animation steps"

# sprite and duration in milliseconds
AnimationStep : (Sprite, U64)

walkingAnimation : List AnimationStep
walkingAnimation = [
    (SpriteAtlas.playerGreenwalk1, 100),
    (SpriteAtlas.playerGreenwalk2, 100),
    (SpriteAtlas.playerGreenwalk3, 100),
    (SpriteAtlas.playerGreenwalk2, 100),
]

idlingAnimation : List AnimationStep
idlingAnimation = [
    (SpriteAtlas.playerGreenwalk1, 4 * 1000),
    (SpriteAtlas.playerGreenstand, 2 * 1000),
    (SpriteAtlas.playerGreenwalk1, 4 * 1000),
    (SpriteAtlas.playerGreenup1, 2 * 1000),
]
