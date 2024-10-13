app [main, Model] {
    raylib: platform "../platform/main.roc",
}

import Polygon.Sides as Sides
import Polygon exposing [Polygon]
import raylib.Raylib exposing [Vector2]

# TODO
# - update platform
#   - merge upstream
#   - use platform state
#   - use keys?
#
# - collision/death
#   - detect collision
#   - freeze
#   - text
#   - restart button
#   - high score
# - score
#   - display
#   - increase on the beat
#
# - someday
#   - vary the obstacle shapes
#     - n sides
#     - n missing sides
#     - missing corners?

main = { init, render }

Model : {
    width : F32,
    height : F32,
    center : Vector2,
    frameCount : I64,
    spawnTimer : I64,
    spawnedPolygons : List SpawnedPolygon,
    playerRotation : F32,
    playerRadius : F32,
    beat : F32,
    bpm : F32,
}

# frames per second
fps : I32
fps = 60

initialWidth = 800f32
initialHeight = 600f32

init : Task Model {}
init =
    Raylib.setWindowSize! { width: initialWidth, height: initialHeight }
    Raylib.setWindowTitle! "Super Pentagon"
    Raylib.setTargetFPS! fps

    center = {
        x: initialWidth / 2,
        y: initialHeight / 2,
    }

    Task.ok {
        width: initialWidth,
        height: initialHeight,
        center,
        frameCount: 0,
        spawnTimer: 0,
        spawnedPolygons: [],
        playerRotation: -(Num.pi / 2),
        playerRadius: initialPlayerRadius,
        beat: 0.0,
        bpm: 120,
    }

initialPlayerRadius = 80.0

# spawn a new polygon every n frames
spawnRate = 300

render : Model -> Task Model {}
render = \model ->
    frameCount = Raylib.getFrameCount!
    mouse = Raylib.getMousePosition!

    newModel = update { model, frameCount, mouse }
    world = modelToWorld newModel
    draw! world

    Task.ok newModel

update : { model : Model, frameCount : I64, mouse : Vector2 } -> Model
update = \{ model, frameCount, mouse } ->
    # In practice, this is 0 once and then 1 forever;
    # it's supposed to be a stand-in for deltaTime
    deltaFrames = frameCount - model.frameCount

    # a tweaked sine wave added to objects' size & position
    # ranges from 1.0 to -1.0
    beat =
        seconds = Num.toF32 frameCount / Num.toF32 fps
        secondsRadians = seconds * Num.tau + (Num.pi / 2.0)
        bps = model.bpm / 60
        wave = Num.sin (secondsRadians * bps)
        if wave < -2 / 3 then -1.0 else wave

    (spawnTimer, spawn) =
        tickedTimer = model.spawnTimer + deltaFrames
        if tickedTimer > spawnRate then
            (tickedTimer % spawnRate, SpawnPentagon)
        else
            (tickedTimer, None)

    spawnedPolygons : List SpawnedPolygon
    spawnedPolygons =
        handleSpawn = \polygons ->
            when spawn is
                SpawnPentagon ->
                    spawned = newSpawnedPentagon model.center
                    List.append polygons spawned

                None -> polygons

        updateAndDespawn = \polygons ->
            List.keepOks polygons \poly ->
                updatePolygon poly { deltaFrames, bpm: model.bpm }

        addBeatToPolygon = \polygon -> { polygon & radius: polygon.radius + beat * 10.0 }
        addBeatToSpawnedPolygons = \polygons ->
            polygons |> List.map (\sp -> { sp & polygon: addBeatToPolygon sp.polygon })

        model.spawnedPolygons
        |> handleSpawn
        |> updateAndDespawn
        |> addBeatToSpawnedPolygons

    intentRange = 75.0
    intent =
        mid = model.center.x
        min = mid - intentRange
        max = mid + intentRange
        clamped = clamp mouse.x { min, max }
        (clamped - mid) / intentRange

    playerSpeed = 2 / 360
    playerRadius = initialPlayerRadius
    playerRotation = model.playerRotation + (intent * playerSpeed * Num.tau)

    {
        width: model.width,
        height: model.height,
        center: model.center,
        bpm: model.bpm,
        frameCount,
        spawnTimer,
        spawnedPolygons,
        playerRotation,
        playerRadius,
        beat,
    }

clamp : F32, { min : F32, max : F32 } -> F32
clamp = \n, { min, max } ->
    if n < min then
        min
    else if n > max then
        max
    else
        n

draw : World -> Task {} {}
draw = \world ->
    Task.forEach! world.obstacles Raylib.drawLine
    Polygon.draw! world.player

initialRadius = initialHeight * 0.9

newPentagon : Vector2 -> Polygon
newPentagon = \center -> {
    sides: Sides.threePlus 2,
    rotation: 0.0,
    color: Silver,
    radius: initialRadius,
    center,
}

newSpawnedPentagon : Vector2 -> SpawnedPolygon
newSpawnedPentagon = \center ->
    polygon = newPentagon center
    gaps = [2, 4]
    { polygon, gaps, age: 0 }

SpawnedPolygon : {
    # the full original polygon
    # avoid using this
    polygon : Polygon,
    # indexes of the edges to leave out of the polygon
    gaps : List U64,
    # frames since spawn
    age : I64,
}

nonGapLines : SpawnedPolygon -> List (Vector2, Vector2)
nonGapLines = \sp ->
    allLines = Polygon.edges sp.polygon
    List.walkWithIndex allLines [] \filtered, line, i ->
        if List.contains sp.gaps i then
            filtered
        else
            List.append filtered line

updatePolygon : SpawnedPolygon, { bpm : F32, deltaFrames : I64 } -> Result SpawnedPolygon [Despawn]
updatePolygon = \spawnedPolygon, { bpm, deltaFrames } ->
    polygon = spawnedPolygon.polygon
    age = spawnedPolygon.age
    newAge = age + deltaFrames

    rotationDegrees = (bpm / 120) * Num.toF32 newAge
    rotation = (rotationDegrees / 360) * Num.tau

    radius =
        granularity = 600
        num =
            newAge
            |> Num.rem granularity
            |> \n -> (Num.toF32 granularity - Num.toF32 n)
            |> \n -> n * initialRadius
        denom = Num.toF32 granularity
        num / denom

    newPolygon = { polygon & rotation, radius }

    # setting this too small results in no despawns
    despawnRadius = 1

    if newPolygon.radius < despawnRadius then
        Err Despawn
    else
        Ok { spawnedPolygon & polygon: newPolygon, age: newAge }

World : {
    player : Polygon,
    obstacles : List { start : Vector2, end : Vector2, color : Raylib.Color },
}

modelToWorld : Model -> World
modelToWorld = \model ->
    player = playerPolygon model
    obstacles = List.joinMap model.spawnedPolygons \sp ->
        lines = nonGapLines sp
        List.map lines \(start, end) -> { start, end, color: sp.polygon.color }
    { player, obstacles }

playerSize = 10.0

# TODO move this to update (need explicit stages)
# spit out a bunch of lines to collide and draw
playerPolygon : Model -> Polygon
playerPolygon = \model ->
    # reversed from polygons, normalized to between 0 and 1
    playerBeat = (-model.beat + 1.0) * 0.5

    sizeModifier = playerBeat * 1.5
    positionMultiplier = playerBeat * 0.05 + 1.0

    playerCenter = {
        x: model.center.x + (Num.cos model.playerRotation) * model.playerRadius * positionMultiplier,
        y: model.center.y + (Num.sin model.playerRotation) * model.playerRadius * positionMultiplier,
    }

    {
        sides: Sides.threePlus 0,
        color: Fuchsia,
        rotation: model.playerRotation,
        center: playerCenter,
        radius: playerSize + sizeModifier,
    }

