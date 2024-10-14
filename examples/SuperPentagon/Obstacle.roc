module [
    Obstacle,
    age,
    color,
    edges,
    lines,
    new,
    updateAge,
    updatePolygon,
]

import ray.Raylib exposing [Vector2]

import SuperPentagon.Polygon as Polygon exposing [Polygon]

# a moving polygon with gaps in it
Obstacle := {
    # frames since spawn
    age : I64,

    # indexes of the edges to leave out of the polygon
    gaps : List U64,

    # the full original polygon (private)
    polygon : Polygon,
}

new : { polygon : Polygon, gaps : List U64 } -> Obstacle
new = \{ polygon, gaps } ->
    @Obstacle { polygon, gaps, age: 0 }

updatePolygon : Obstacle, (Polygon -> Polygon) -> Obstacle
updatePolygon = \@Obstacle obstacle, update ->
    @Obstacle { obstacle & polygon: update obstacle.polygon }

updateAge : Obstacle, I64 -> Obstacle
updateAge = \@Obstacle obstacle, newAge -> @Obstacle { obstacle & age: newAge }

age : Obstacle -> I64
age = \@Obstacle obstacle -> obstacle.age

color : Obstacle -> Raylib.Color
color = \@Obstacle obstacle -> obstacle.polygon.color

lines : Obstacle -> List { start : Vector2, end : Vector2, color : Raylib.Color }
lines = \@Obstacle obstacle ->
    allEdges = Polygon.edges obstacle.polygon

    filledEdges = List.walkWithIndex allEdges [] \filtered, line, i ->
        if List.contains obstacle.gaps i then
            filtered
        else
            List.append filtered line

    List.map filledEdges \(start, end) ->
        { start, end, color: obstacle.polygon.color }

edges : Obstacle -> List (Vector2, Vector2)
edges = \obstacle ->
    obstacle
    |> lines
    |> List.map \{ start, end } -> (start, end)
