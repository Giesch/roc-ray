app [main, Model] {
    ray: platform "../platform/main.roc",
}

import ray.Raylib exposing [Vector2]

main = { init, render }

Model : {
    width : F32,
    height : F32,
    radius : F32,
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

    Task.ok {
        width: initialWidth,
        height: initialHeight,
        radius: initialRadius,
    }

render : Model -> Task Model {}
render = \model ->
    center = {
        x: model.width / 2,
        y: model.height / 2,
    }

    frames : I64
    frames = Raylib.getFrameCount!

    rotation = Num.toF32 frames
    drawPolygon! {
        n: 5,
        rotation: rotation,
        color: Silver,
        radius: model.radius,
        center,
    }

    granularity : U64
    granularity = 600

    radiusStep =
        Num.toF32 frames
        |> Num.floor
        |> Num.rem granularity
        |> \n -> (Num.toF32 granularity - Num.toF32 n)

    newRadius = initialRadius * (Num.toF32 radiusStep / (Num.toF32 granularity))

    Task.ok { model & radius: newRadius }

degreesToRadians : F32 -> F32
degreesToRadians = \deg ->
    deg * Num.pi / 180.0

addPoints : Vector2, Vector2 -> Vector2
addPoints = \a, b ->
    { x: a.x + b.x, y: a.y + b.y }

slidingPairs : List a -> List (a, a)
slidingPairs = \list ->
    # thanks Aurelien
    offset = (list |> List.sublist { start: 1, len: (List.len list - 1) })
    List.map2 list offset \a, b -> (a, b)

drawPolygon :
    {
        n : U64,
        rotation : F32,
        color : Raylib.Color,
        radius : F32,
        center : Vector2,
    }
    -> Task {} {}
drawPolygon = \{ n, rotation, color, radius, center } ->
    atAngle = \radians ->
        x = radius * Num.cos radians
        y = radius * Num.sin radians
        addPoints center { x, y }

    corners =
        List.range { start: At 0, end: Length n }
        |> List.map \step -> atAngle ((step * 72.0 + rotation) |> degreesToRadians)

    lastSide =
        when (List.last corners, List.first corners) is
            (Ok last, Ok first) -> (last, first)
            _ -> crash "at least one side per polygon please"

    sides = (slidingPairs corners) |> List.append lastSide

    Task.forEach sides \(start, end) ->
        Raylib.drawLine! { start: start, end: end, color: color }
