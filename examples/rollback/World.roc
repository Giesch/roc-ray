module [
    World,
    Player,
    Facing,
    Intent,
    tick,
    checksum,
    positionsChecksum,
    playerFacing,
    initial,
    playerStart,
]

import Input exposing [Input]
import Pixel exposing [PixelVec]
import Resolution exposing [width, height]

## the game state unrelated to rollback bookkeeping
World : {
    ## the player on the machine we're running on
    localPlayer : Player,
    ## the player on a remote machine
    remotePlayer : Player,
}

Player : {
    pos : PixelVec,
    intent : Intent,
}

Intent : [
    Thrust Facing,
    Coast Facing,
]

Facing : ([West, East, None], [North, South, None])

TickContext : {
    tick : U64,
    timestampMillis : U64,
    localInput : Input,
    remoteInput : Input,
}

initial : World
initial = {
    localPlayer: playerStart,
    remotePlayer: {
        pos: playerStart.pos,
        intent: playerStart.intent,
    },
}

playerStart : Player
playerStart =
    x = Pixel.fromPixels (width // 2)
    y = Pixel.fromPixels (height // 2)

    {
        pos: { x, y },
        intent: Coast (None, None),
    }

## used by Rollback for checking desyncs
checksum : World -> I64
checksum = \{ localPlayer, remotePlayer } ->
    positionsChecksum {
        localPlayerPos: localPlayer.pos,
        remotePlayerPos: remotePlayer.pos,
    }

positionsChecksum : { localPlayerPos : PixelVec, remotePlayerPos : PixelVec } -> I64
positionsChecksum = \{ localPlayerPos, remotePlayerPos } ->
    # you would want to use a real checksum in a real game

    xSum = Pixel.totalSubpixels localPlayerPos.x + Pixel.totalSubpixels remotePlayerPos.x
    ySum = Pixel.totalSubpixels localPlayerPos.y + Pixel.totalSubpixels remotePlayerPos.y

    xSum + 10 * ySum

## advance the game state one discrete step
tick : World, TickContext -> World
tick = \state, { localInput, remoteInput } ->
    localPlayer =
        oldPlayer = state.localPlayer
        intent = inputToIntent localInput (playerFacing oldPlayer)
        movePlayer { oldPlayer & intent } intent

    remotePlayer =
        oldRemotePlayer = state.remotePlayer
        intent = inputToIntent remoteInput (playerFacing oldRemotePlayer)
        movePlayer { oldRemotePlayer & intent } intent

    { localPlayer, remotePlayer }

movePlayer : Player, Intent -> Player
movePlayer = \player, intent ->
    { pos } = player

    moveSpeed = { subpixels: 80 }

    newPos =
        when intent is
            Thrust (East, None) ->
                x = Pixel.add pos.x moveSpeed
                { pos & x }

            Thrust (East, South) ->
                x = Pixel.add pos.x moveSpeed
                y = Pixel.add pos.y moveSpeed
                { pos & x, y }

            Thrust (None, South) ->
                y = Pixel.add pos.y moveSpeed
                { pos & y }

            Thrust (West, South) ->
                x = Pixel.sub pos.x moveSpeed
                y = Pixel.add pos.y moveSpeed
                { pos & x, y }

            Thrust (West, None) ->
                x = Pixel.sub pos.x moveSpeed
                { pos & x }

            Thrust (West, North) ->
                x = Pixel.sub pos.x moveSpeed
                y = Pixel.sub pos.y moveSpeed
                { pos & x, y }

            Thrust (None, North) | Thrust (None, None) ->
                y = Pixel.sub pos.y moveSpeed
                { pos & y }

            Thrust (East, North) ->
                x = Pixel.add pos.x moveSpeed
                { pos & x }

            Coast _facing -> pos

    { player & pos: newPos }

inputToIntent : Input, Facing -> Intent
inputToIntent = \{ up, down, left, right }, facing ->
    horizontal =
        when (left, right) is
            (Down, Up) -> West
            (Up, Down) -> East
            _same -> None

    vertical =
        when (up, down) is
            (Down, Up) -> North
            (Up, Down) -> South
            _same -> None

    when (horizontal, vertical) is
        (None, None) -> Coast facing
        (h, v) -> Thrust (h, v)

playerFacing : { intent : Intent }a -> Facing
playerFacing = \{ intent } ->
    when intent is
        Coast facing -> facing
        Thrust facing -> facing
