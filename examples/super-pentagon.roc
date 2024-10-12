app [main, Model] {
    ray: platform "../platform/main.roc",
}

import Polygon exposing [Polygon]
import ray.Raylib exposing [Vector2]

main = { init, render }

Model : {
    width : F32,
    height : F32,
    center : Vector2,
    frames : I64,
    spawnTimer : I64,
    spawnedPolygons : List SpawnedPolygon,
}

fps : I32
fps = 60

initialWidth = 800f32
initialHeight = 600f32

initialRadius = initialHeight * 0.9

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
        frames: 0,
        spawnTimer: 0,
        spawnedPolygons: [],
    }

# spawn a new polygon every n frames
spawnRate = 30

render : Model -> Task Model {}
render = \model ->
    frameCount : I64
    frameCount = Raylib.getFrameCount!

    deltaFrames = frameCount - model.frames
    (spawnTimer, spawnPenta) =
        if (model.spawnTimer + deltaFrames) > spawnRate then
            ((model.spawnTimer + deltaFrames) % spawnRate, Bool.true)
        else
            (model.spawnTimer + deltaFrames, Bool.false)

    spawnedPolygons : List SpawnedPolygon
    spawnedPolygons =
        model.spawnedPolygons
        |> (\polys ->
            if spawnPenta then
                poly = {
                    sides: 5,
                    rotation: 0.0,
                    color: Silver,
                    radius: initialRadius,
                    center: model.center,
                }
                List.append polys { polygon: poly, age: 0 }
            else
                polys
        )
        |> List.keepOks (\poly -> updatePolygon poly deltaFrames)

    Task.forEach! spawnedPolygons (\sp -> Polygon.draw sp.polygon)

    Task.ok
        { model &
            frames: frameCount,
            spawnTimer,
            spawnedPolygons,
        }

SpawnedPolygon : {
    polygon : Polygon,
    age : I64,
}

updatePolygon : SpawnedPolygon, I64 -> Result SpawnedPolygon [Despawn]
updatePolygon = \{ polygon, age }, deltaFrames ->
    newAge = age + deltaFrames

    rotation = Num.toF32 newAge

    granularity : I64
    granularity = 600

    radiusStep : F32
    radiusStep =
        newAge
        |> Num.rem granularity
        |> \n -> (Num.toF32 granularity - Num.toF32 n)

    radius = initialRadius * (Num.toF32 radiusStep / (Num.toF32 granularity))

    newPolygon = { polygon &
        rotation: rotation,
        radius: radius,
    }

    if newPolygon.radius < 0.01 then
        Err Despawn
    else
        Ok { polygon: newPolygon, age: newAge }
