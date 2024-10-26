module [World, Player, Animation, frameTick, new, playerFacing]

import rr.RocRay exposing [PlatformState]

import Input

## the game's physics simulation
World : {
    ## the unspent milliseconds remaining after the last tick (or frame)
    remainingMillis : F32,
    player : Player,
}

Player : {
    x : F32,
    y : F32,
    intent : Intent,
    animation : Animation,
}

Intent : [Idle Facing, Walk Facing]
Facing : [Right, Left]

Animation : [
    Standing F32,
    Walking F32,
]

ticksPerSecond : U64
ticksPerSecond = 120

millisPerTick : F32
millisPerTick = 1000 / Num.toF32 ticksPerSecond

new : Player -> World
new = \player ->
    { player, remainingMillis: 0 }

## use as many physics ticks as the frame duration allows
frameTick : World, PlatformState, F32 -> World
frameTick = \world, state, deltaTime ->
    remainingMillis = world.remainingMillis + deltaTime
    useAllRemainingTime { world & remainingMillis } state

useAllRemainingTime : World, PlatformState -> World
useAllRemainingTime = \world, state ->
    if world.remainingMillis <= millisPerTick then
        world
    else
        tickedWorld = tick world state
        useAllRemainingTime tickedWorld state

## a single physics tick
tick : World, PlatformState -> World
tick = \world, state ->
    intent =
        facing = playerFacing world.player
        Input.read state facing

    xMove =
        when intent is
            Walk Right -> 1.0
            Walk Left -> -1.0
            Idle _facing -> 0.0

    animation =
        when (intent, world.player.animation) is
            (Idle _facing, Standing millis) -> Standing (millis + millisPerTick)
            (Idle _facing, _other) -> Standing 0
            (Walk _facing, Walking millis) -> Walking (millis + millisPerTick)
            (Walk _facing, _other) -> Walking 0

    player =
        oldPlayer = world.player
        runSpeed = 0.5
        x = oldPlayer.x + xMove * runSpeed * millisPerTick
        { oldPlayer & intent, animation, x }

    remainingMillis = world.remainingMillis - millisPerTick

    { world & remainingMillis, player }

playerFacing : Player -> Facing
playerFacing = \player ->
    when player.intent is
        Idle facing -> facing
        Walk facing -> facing
