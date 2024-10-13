app [main, Model] {
    ray: platform "../platform/main.roc",
}

import Polygon.Sides as Sides
import Polygon exposing [Polygon]
import ray.Raylib exposing [Vector2]

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
}

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
        playerRotation: -90.0,
        playerRadius: initialPlayerRadius,
        beat: 0.0,
    }

initialPlayerRadius = 80.0

# spawn a new polygon every n frames
spawnRate = 300

render : Model -> Task Model {}
render = \model ->
    frameCount = Raylib.getFrameCount!
    mouse = Raylib.getMousePosition!

    newModel = update { model, frameCount, mouse }

    draw! newModel

    Task.ok newModel

update : { model : Model, frameCount : I64, mouse : Vector2 } -> Model
update = \{ model, frameCount, mouse } ->
    # In practice, this is 0 once and then 1 forever;
    # it's supposed to be a stand-in for deltaTime
    deltaFrames = frameCount - model.frameCount

    # a sine wave adjustment added to objects' size
    # ranges from 1.0 to -1.0
    beat =
        speed = 12.0
        seconds = Num.toF32 frameCount / Num.toF32 fps
        Num.sin (seconds * speed)

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
                    polygon = newPentagon model.center
                    List.append polygons { polygon, age: 0 }

                None -> polygons

        updateAndDespawn = \polygons ->
            polygons |> List.keepOks (\poly -> updatePolygon poly deltaFrames)

        addBeatToPolygon = \polygon ->
            { polygon & radius: polygon.radius + beat * 10.0 }
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

    playerSpeed = 2
    playerRadius = initialPlayerRadius
    playerRotation = model.playerRotation + (intent * playerSpeed)

    {
        width: model.width,
        height: model.height,
        center: model.center,
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

draw : Model -> Task {} {}
draw = \model ->
    Task.forEach! model.spawnedPolygons (\sp -> Polygon.draw sp.polygon)
    drawPlayer! model

initialRadius = initialHeight * 0.9

newPentagon : Vector2 -> Polygon
newPentagon = \center -> {
    sides: Sides.threePlus 2,
    rotation: 0.0,
    color: Silver,
    radius: initialRadius,
    center,
}

SpawnedPolygon : {
    polygon : Polygon,
    age : I64,
}

updatePolygon : SpawnedPolygon, I64 -> Result SpawnedPolygon [Despawn]
updatePolygon = \{ polygon, age }, deltaFrames ->
    newAge = age + deltaFrames

    rotation = Num.toF32 newAge

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
        Ok { polygon: newPolygon, age: newAge }

drawPlayer : Model -> Task {} {}
drawPlayer = \{ playerRotation, playerRadius, center, beat } ->
    (sizeModifier, positionMultiplier) =
        reverseBeat = -beat
        if reverseBeat > 0 then
            sizeMod = (reverseBeat + 1.0) * 0.5
            (sizeMod, sizeMod * 0.05 + 1.0)
        else
            (0.0, 1.0)

    playerRadians = Polygon.degreesToRadians playerRotation
    playerCenter = {
        x: center.x + (Num.cos playerRadians) * playerRadius * positionMultiplier,
        y: center.y + (Num.sin playerRadians) * playerRadius * positionMultiplier,
    }

    radius = 10.0 + sizeModifier

    Polygon.draw! {
        sides: Sides.threePlus 0,
        color: Fuchsia,
        rotation: playerRotation,
        center: playerCenter,
        radius,
    }
