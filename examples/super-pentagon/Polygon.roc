module [
    Polygon,
    draw,
    edges,
    lines,
    verticies,
]

import rr.RocRay exposing [Color, Vector2]
import rr.Draw

import Sides exposing [Sides]

Polygon : {
    sides : Sides,
    rotation : F32,
    color : Color,
    radius : F32,
    center : Vector2,
}

draw : Polygon -> Task {} []
draw = \polygon ->
    Task.forEach! (edges polygon) \(start, end) ->
        Draw.line! { start, end, color: polygon.color }

edges : Polygon -> List (Vector2, Vector2)
edges = \polygon ->
    corners = verticies polygon

    lastSide =
        when (List.last corners, List.first corners) is
            (Ok last, Ok first) -> (last, first)
            _ -> crash "at least one side per polygon please"

    (slidingPairs corners) |> List.append lastSide

lines : Polygon -> List { start : Vector2, end : Vector2, color : Color }
lines = \polygon ->
    List.map (edges polygon) \(start, end) ->
        { start, end, color: polygon.color }

verticies : Polygon -> List Vector2
verticies = \{ sides, rotation, radius, center } ->
    atAngle = \radians ->
        x = radius * Num.cos radians
        y = radius * Num.sin radians
        addPoints center { x, y }

    turnRadians = Num.tau / (sides |> Sides.count |> Num.toFrac)

    List.range { start: At 0, end: Length (Sides.count sides) }
    |> List.map \step -> atAngle (step * turnRadians + rotation)

addPoints : Vector2, Vector2 -> Vector2
addPoints = \a, b ->
    { x: a.x + b.x, y: a.y + b.y }

slidingPairs : List a -> List (a, a)
slidingPairs = \list ->
    # thanks Aurelien
    offset = (list |> List.sublist { start: 1, len: (List.len list - 1) })
    List.map2 list offset \a, b -> (a, b)

