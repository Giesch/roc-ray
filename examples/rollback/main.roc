app [Model, init!, render!] {
    rr: platform "../../platform/main.roc",
    json: "https://github.com/lukewilliamboswell/roc-json/releases/download/0.10.2/FH4N0Sw-JSFXJfG3j54VEDPtXOoN-6I9v_IA8S18IGk.tar.br",
}

### This is an example of using RocRay's matchbox networking integration for a peer-to-peer multiplayer game.
### The Rollback module is based on pseudocode from the Guilty Gear Strive team.
### Note that this version relies on TCP for handling message ordering and packet loss.
### In a real game or polished networking library, you'd likely do many things differently.
###
### Matchbox WebRTC: https://github.com/johanhelsing/matchbox
### GGST's Rollback Pseudocode: https://gist.github.com/rcmagic/f8d76bca32b5609e85ab156db38387e9
### An explanation of fixed timestep: https://gafferongames.com/post/fix_your_timestep/

import rr.RocRay exposing [PlatformState]
import rr.Draw
import rr.Network

import json.Json

import Resolution exposing [width, height]
import Rollback
import Pixel
import Input
import World
import Config
import Polygon exposing [Polygon]
import Polygon.Sides

Model : [Waiting WaitingModel, Connected ConnectedModel]

WaitingModel : {}

ConnectedModel : {
    world : Rollback.Recording,
    timestampMillis : U64,
}

init! : {} => Result Model _
init! = \{} ->
    serverUrl = "$(Config.baseUrl)/yolo?next=2"

    RocRay.setTargetFPS! 120
    RocRay.displayFPS! { fps: Visible, pos: { x: 100, y: 100 } }
    Network.configure! { serverUrl }
    RocRay.initWindow! {
        title: "Rollback Example",
        width: Num.toF32 width,
        height: Num.toF32 height,
    }

    waiting : WaitingModel
    waiting = {}

    Ok (Waiting waiting)

render! : Model, RocRay.PlatformState => Result Model []
render! = \model, state ->
    when model is
        Waiting waiting -> renderWaiting! waiting state
        Connected connected -> renderConnected! connected state

drawConnected! : ConnectedModel, PlatformState => {}
drawConnected! = \{ world }, state ->
    Draw.draw! Black \{} ->
        currentState = Rollback.currentState world

        # draw players
        drawPlayerTriangle! currentState.localPlayer Green
        drawPlayerTriangle! currentState.remotePlayer Blue

        # draw ui
        when Rollback.desyncStatus world is
            Synced -> {}
            Desynced report ->
                text =
                    tick = Inspect.toStr report.remoteSyncTick
                    when report.kind is
                        Desync -> "DESYNC DETECTED ON TICK: $(tick)"
                        MissingChecksum -> "MISSING CHECKSUM FOR TICK: $(tick)"

                Draw.text! {
                    text,
                    pos: { x: 10, y: Num.toF32 height - 50 },
                    size: 24,
                    color: White,
                }

        displayPeerConnections! state.network.peers

drawPlayerTriangle! : World.Player, RocRay.Color => {}
drawPlayerTriangle! = \player, color ->
    triangleRotationForFacing = \facing ->
        when facing is
            (East, None) -> 0
            (East, South) -> Num.tau * 1 / 8
            (None, South) -> Num.tau * 2 / 8
            (West, South) -> Num.tau * 3 / 8
            (West, None) -> Num.tau * 4 / 8
            (West, North) -> Num.tau * 5 / 8
            (None, North) | (None, None) -> Num.tau * 6 / 8
            (East, North) -> Num.tau * 7 / 8

    rotation =
        player
        |> World.playerFacing
        |> triangleRotationForFacing

    triangle : Polygon
    triangle = {
        color,
        rotation,
        sides: Polygon.Sides.threePlus 0,
        radius: 20,
        center: Pixel.toVector2 player.pos,
    }

    Polygon.draw! triangle

renderWaiting! : WaitingModel, PlatformState => Result Model []
renderWaiting! = \waiting, state ->
    inbox : List Rollback.PeerMessage
    inbox = decodeFrameMessages state.network.messages

    joinMessage = List.last inbox

    when joinMessage is
        Ok _message ->
            waitingToConnected! waiting state

        Err ListWasEmpty ->
            sendHostWaiting! state.network
            drawWaiting! waiting
            Ok (Waiting waiting)

        Err (Leftover _) | Err TooShort ->
            RocRay.log! "decode error" LogError
            sendHostWaiting! state.network
            drawWaiting! waiting
            Ok (Waiting waiting)

waitingToConnected! : WaitingModel, PlatformState => Result Model []
waitingToConnected! = \_waiting, state ->
    world : Rollback.Recording
    world = Rollback.start {
        config: Config.rollback,
        state: World.initial,
    }

    connected : ConnectedModel
    connected = {
        world,
        timestampMillis: state.timestamp.renderStart,
    }

    drawConnected! connected state

    Ok (Connected connected)

drawWaiting! : WaitingModel => {}
drawWaiting! = \_waiting ->
    Draw.draw! Silver \{} ->
        localPlayer = World.playerStart
        drawPlayerTriangle! localPlayer Green

renderConnected! : ConnectedModel, PlatformState => Result Model []
renderConnected! = \oldModel, state ->
    timestampMillis = state.timestamp.renderStart
    network = state.network

    deltaMillis = timestampMillis - oldModel.timestampMillis

    inbox : List Rollback.PeerMessage
    inbox = decodeFrameMessages network.messages

    localInput = Input.read state.keys

    world = Rollback.advance oldModel.world { localInput, deltaMillis, inbox }

    model = { oldModel & world, timestampMillis }

    messages = Rollback.recentMessages world
    sendFrameMessages! messages network

    drawConnected! model state

    when Rollback.blockStatus world is
        Advancing -> {}
        Skipped -> {}
        BlockedFor blockedFrames if blockedFrames < 50 ->
            {}

        BlockedFor blockedFrames if blockedFrames < 500 ->
            RocRay.log! "Blocked for $(Inspect.toStr blockedFrames) frames" LogWarning

        BlockedFor _blockedFrames ->
            crashInfo = Rollback.showCrashInfo world
            history = Rollback.writableHistory world
            crash "blocked world:\n$(crashInfo)\n$(history)"

    Ok (Connected model)

displayPeerConnections! : RocRay.NetworkPeers => {}
displayPeerConnections! = \{ connected, disconnected } ->
    combined =
        List.concat
            (connected |> List.map \uuid -> "CONNECTED: $(Network.toStr uuid)")
            (disconnected |> List.map \uuid -> "DISCONNECTED: $(Network.toStr uuid)")
        |> List.append "NETWORK PEERS $(Num.toStr (List.len connected)) connected, $(Num.toStr (List.len disconnected)) disconnected"

    List.range { start: At 0, end: Before (List.len combined) }
    |> List.map \i -> {
        pos: { x: 10, y: (Num.toF32 height) - 10 - (Num.toFrac (i * 10)) },
        text: List.get combined i |> Result.withDefault "OUT OF BOUNDS",
        size: 10,
        color: Black,
    }
    |> forEach! Draw.text!

sendHostWaiting! : RocRay.NetworkState => {}
sendHostWaiting! = \network ->
    waitingMessage : Rollback.FrameMessage
    waitingMessage =
        syncTickChecksum = World.positionsChecksum {
            localPlayerPos: World.playerStart.pos,
            remotePlayerPos: World.playerStart.pos,
        }

        {
            firstTick: 0,
            lastTick: 0,
            tickAdvantage: 0,
            input: Input.blank,
            syncTick: 0,
            syncTickChecksum,
        }

    sendFrameMessages! [waitingMessage] network

sendFrameMessages! : List Rollback.FrameMessage, RocRay.NetworkState => {}
sendFrameMessages! = \messages, network ->
    jsonMessages = List.map messages worldToNetwork
    bytes = Encode.toBytes jsonMessages Json.utf8
    forEach! network.peers.connected \peer -> RocRay.sendToPeer! bytes peer

decodeFrameMessages : List RocRay.NetworkMessage -> List Rollback.PeerMessage
decodeFrameMessages = \messages ->
    List.joinMap messages \networkMsg ->
        decodeResult : Result (List FrameMessageJson) _
        decodeResult = Decode.fromBytes networkMsg.bytes Json.utf8

        when decodeResult is
            Ok jsonArray ->
                List.map jsonArray \json ->
                    { id: networkMsg.id, message: networkToWorld json }

            Err e ->
                crashInfo = Inspect.toStr {
                    decodeError: e,
                    networkMessage: Str.fromUtf8 networkMsg.bytes,
                }
                crash "decode error: $(crashInfo)"

FrameMessageJson : {
    firstTick : I64,
    lastTick : I64,
    tickAdvantage : I64,
    inputByte : I64,
    syncTick : I64,
    syncTickChecksum : I64,
}

networkToWorld : FrameMessageJson -> Rollback.FrameMessage
networkToWorld = \json -> {
    input: json.inputByte |> Num.toU8 |> Input.fromByte,
    firstTick: json.firstTick,
    lastTick: json.lastTick,
    tickAdvantage: json.tickAdvantage,
    syncTick: json.syncTick,
    syncTickChecksum: json.syncTickChecksum,
}

worldToNetwork : Rollback.FrameMessage -> FrameMessageJson
worldToNetwork = \message -> {
    inputByte: message.input |> Input.toByte |> Num.toI64,
    firstTick: message.firstTick,
    lastTick: message.lastTick,
    tickAdvantage: message.tickAdvantage,
    syncTick: message.syncTick,
    syncTickChecksum: message.syncTickChecksum,
}

# TODO REPLACE WITH BUILTIN
forEach! : List a, (a => {}) => {}
forEach! = \l, f! ->
    when l is
        [] -> {}
        [x, .. as xs] ->
            f! x
            forEach! xs f!

