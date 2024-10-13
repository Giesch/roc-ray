module [draw, Polygon, degreesToRadians, radiansToDegrees, edges, verticies]

import ray.Raylib exposing [Vector2]
import Polygon.Sides as Sides exposing [Sides]

Polygon : {
    sides : Sides,
    rotation : F32,
    color : Raylib.Color,
    radius : F32,
    center : Vector2,
}

draw : Polygon -> Task {} {}
draw = \polygon ->
    Task.forEach (edges polygon) \(start, end) ->
        Raylib.drawLine! { start: start, end: end, color: polygon.color }

edges : Polygon -> List (Vector2, Vector2)
edges = \polygon ->
    corners = verticies polygon

    lastSide =
        when (List.last corners, List.first corners) is
            (Ok last, Ok first) -> (last, first)
            _ -> crash "at least one side per polygon please"

    (slidingPairs corners) |> List.append lastSide

verticies : Polygon -> List Vector2
verticies = \{ sides, rotation, radius, center } ->
    rotationRadians = rotation |> degreesToRadians

    atAngle = \radians ->
        x = radius * Num.cos radians
        y = radius * Num.sin radians
        addPoints center { x, y }

    turnRadians = 2 * Num.pi / (sides |> Sides.count |> Num.toFrac)

    List.range { start: At 0, end: Length (Sides.count sides) }
    |> List.map \step -> atAngle (step * turnRadians + rotationRadians)

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

radiansToDegrees : F32 -> F32
radiansToDegrees = \rad ->
    rad * 180.0 / Num.pi
