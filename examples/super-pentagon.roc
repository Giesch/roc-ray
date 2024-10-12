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
        playerRadius: 80.0,
    }

# spawn a new polygon every n frames
spawnRate = 300

render : Model -> Task Model {}
render = \model ->
    frameCount : I64
    frameCount = Raylib.getFrameCount!

    # In practice, this is 0 once and then 1 forever,
    # but it's a stand-in for deltaTime
    deltaFrames = frameCount - model.frameCount

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

        model.spawnedPolygons
        |> handleSpawn
        |> updateAndDespawn

    mouse = Raylib.getMousePosition!
    intentOffset = 50.0
    intent =
        if mouse.x > (model.center.x + intentOffset) then
            1
        else if mouse.x < (model.center.x - intentOffset) then
            -1
        else
            0
    playerSpeed = 2
    playerRadius = model.playerRadius
    playerRotation = model.playerRotation + (intent * playerSpeed)

    newModel : Model
    newModel = { model &
        frameCount,
        spawnTimer,
        spawnedPolygons,
        playerRotation,
        playerRadius,
    }

    draw! newModel
    Task.ok newModel

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
drawPlayer = \{ playerRotation, playerRadius, center } ->
    playerRadians = Polygon.degreesToRadians playerRotation
    playerCenter = {
        x: center.x + (Num.cos playerRadians) * playerRadius,
        y: center.y + (Num.sin playerRadians) * playerRadius,
    }

    Polygon.draw! {
        sides: Sides.threePlus 0,
        color: Fuchsia,
        rotation: playerRotation,
        radius: 10.0,
        center: playerCenter,
    }
