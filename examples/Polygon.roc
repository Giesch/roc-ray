module [draw, Polygon]

import ray.Raylib exposing [Vector2]

Polygon : {
    sides : U64,
    rotation : F32,
    color : Raylib.Color,
    radius : F32,
    center : Vector2,
}

draw : Polygon -> Task {} {}
draw = \{ sides, rotation, color, radius, center } ->
    atAngle = \radians ->
        x = radius * Num.cos radians
        y = radius * Num.sin radians
        addPoints center { x, y }

    corners =
        List.range { start: At 0, end: Length sides }
        |> List.map \step -> atAngle ((step * 72.0 + rotation) |> degreesToRadians)

    lastSide =
        when (List.last corners, List.first corners) is
            (Ok last, Ok first) -> (last, first)
            _ -> crash "at least one side per polygon please"

    edges = (slidingPairs corners) |> List.append lastSide

    Task.forEach edges \(start, end) ->
        Raylib.drawLine! { start: start, end: end, color: color }

addPoints : Vector2, Vector2 -> Vector2
addPoints = \a, b ->
    { x: a.x + b.x, y: a.y + b.y }

slidingPairs : List a -> List (a, a)
slidingPairs = \list ->
    # thanks Aurelien
    offset = (list |> List.sublist { start: 1, len: (List.len list - 1) })
    List.map2 list offset \a, b -> (a, b)

degreesToRadians : F32 -> F32
degreesToRadians = \deg ->
    deg * Num.pi / 180.0
