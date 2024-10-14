app [main, Model] {
    raylib: platform "../platform/main.roc",
}

import Polygon.Sides as Sides
import Polygon exposing [Polygon]
import raylib.Raylib exposing [Vector2]

# TODO
# - high score
#
# - vary the obstacle shapes
#   - n sides
#   - n missing sides
#   - missing corners?
#
# - update platform
#   - merge upstream
#   - use platform state
#   - use keys? for pause?

main = { init, render }

Model : {
    screen : [Playing, GameOver GameOverModel],
    center : Vector2,
    frameCount : I64,
    spawnTimer : I64,
    spawnedPolygons : List SpawnedPolygon,
    playerRotation : F32,
    playerRadius : F32,
    bpm : F32,
    beat : F32,
    beatDirection : [Up, Down],
    score : U64,
}

# frames per second
fps : I32
fps = 60

windowWidth = 800f32
windowHeight = 600f32

initialBpm = 120
playerSize = 10.0
initialPentagonRadius = windowHeight * 0.9

init : Task Model {}
init =
    Raylib.setWindowSize! { width: windowWidth, height: windowHeight }
    Raylib.setWindowTitle! "Super Pentagon"
    Raylib.setTargetFPS! fps

    Task.ok newGame

newGame : Model
newGame =
    center = { x: windowWidth / 2, y: windowHeight / 2 }

    {
        screen: Playing,
        center,
        frameCount: 0,
        spawnTimer: 0,
        spawnedPolygons: [],
        playerRotation: -(Num.pi / 2),
        playerRadius: initialPlayerRadius,
        bpm: initialBpm,
        beat: 0.0,
        beatDirection: Up,
        score: 0,
    }

initialPlayerRadius = 80.0

# spawn a new polygon every n frames
spawnRate = 300

render : Model -> Task Model {}
render = \model ->
    frameCount = Raylib.getFrameCount!
    mouse = Raylib.getMousePosition!
    mouseButtons = Raylib.mouseButtons!
    click = if mouseButtons.left then LeftClick else None

    newModel =
        when model.screen is
            Playing -> update { model, frameCount, mouse }
            GameOver gameOver -> gameOverUpdate model gameOver click

    draw! (drawModel newModel)

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
    beatDirection = if beat > model.beat then Up else Down
    score =
        when (beatDirection, model.beatDirection) is
            (Up, Down) -> model.score + 1
            _ -> model.score

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
        # This causes a compiler crash
        # mouse.x
        # |> clamp { min, max }
        # |> \clamped -> (clamped - mid) / intentRange
        clamped = clamp mouse.x { min, max }
        (clamped - mid) / intentRange

    playerSpeed = 2 / 360
    playerRadius = initialPlayerRadius
    playerRotation = model.playerRotation + (intent * playerSpeed * Num.tau)

    newModel : Model
    newModel = {
        screen: model.screen,
        center: model.center,
        bpm: model.bpm,
        frameCount,
        spawnTimer,
        spawnedPolygons,
        playerRotation,
        playerRadius,
        beat,
        beatDirection,
        score,
    }

    updateCollision newModel

clamp : F32, { min : F32, max : F32 } -> F32
clamp = \n, { min, max } ->
    if n < min then
        min
    else if n > max then
        max
    else
        n

updateCollision : Model -> Model
updateCollision = \model ->
    collisionModel : CollisionModel
    collisionModel =
        playerLines = model |> playerPolygon |> Polygon.edges
        obstacleLines = List.joinMap model.spawnedPolygons \sp -> nonGapLines sp
        { playerLines, obstacleLines }

    if checkCollision collisionModel then
        screen = GameOver { age: 0, animation: Drifting 0.0 }
        { model & screen }
    else
        model

CollisionModel : {
    playerLines : List (Vector2, Vector2),
    obstacleLines : List (Vector2, Vector2),
}

checkCollision : CollisionModel -> Bool
checkCollision = \{ playerLines, obstacleLines } ->
    # https://stackoverflow.com/a/9997374
    clockwise : Vector2, Vector2, Vector2 -> Bool
    clockwise = \a, b, c ->
        (c.y - a.y) * (b.x - a.x) <= (b.y - a.y) * (c.x - a.x)

    intersect : (Vector2, Vector2), (Vector2, Vector2) -> Bool
    intersect = \(a, b), (c, d) ->
        clockwise a c d != clockwise b c d && clockwise a b c != clockwise a b d

    List.any obstacleLines \obstacleLine ->
        List.any playerLines \playerLine -> intersect playerLine obstacleLine

DrawSlice model : {
    screen : [Playing, GameOver GameOverModel],
    beat : F32,
    center : Vector2,
    playerRotation : F32,
    playerRadius : F32,
    spawnedPolygons : List SpawnedPolygon,
    score : U64,
}model

drawModel : DrawSlice m -> DrawModel
drawModel = \model ->
    player = playerPolygon model
    obstacles = List.joinMap model.spawnedPolygons \spawnedPolygon ->
        lines = nonGapLines spawnedPolygon
        color = spawnedPolygon.polygon.color
        List.map lines \(start, end) -> { start, end, color }

    { player, obstacles, score: model.score, beat: model.beat, screen: model.screen }

DrawModel : {
    screen : [Playing, GameOver GameOverModel],
    player : Polygon,
    obstacles : List { start : Vector2, end : Vector2, color : Raylib.Color },
    score : U64,
    beat : F32,
}

draw : DrawModel -> Task {} {}
draw = \model ->
    Task.forEach! model.obstacles Raylib.drawLine

    player = model.player
    playerColor =
        when model.screen is
            Playing -> player.color
            _ -> Red

    Polygon.draw! { player & color: playerColor }

    drawScore! model

drawScore : DrawModel -> Task {} {}
drawScore = \model ->
    textSizeModifier = (model.score // 4) |> Num.toI32
    textSizeMultiplier = Num.toFrac (model.score // 16) * 0.2 + 1

    textBeat = (-model.beat + 1) * 0.5
    textSizeBeatModifier = 2 * Num.toFrac (model.score // 4) * textBeat

    size =
        (20 + textSizeModifier)
        |> Num.toFrac
        |> Num.mul textSizeMultiplier
        |> Num.add textSizeBeatModifier
        |> Num.floor

    text = Num.toStr (model.score + 1)
    drawScoreNumber = \{ offset } ->
        margin = 50
        Raylib.drawText! { text, size, x: margin + offset, y: margin, color: White }

    when model.screen is
        Playing -> drawScoreNumber { offset: 0 }
        GameOver { animation } ->
            when animation is
                Drifting offset -> drawScoreNumber { offset }
                OfferRestart -> drawRestart

drawRestart =
    Raylib.drawText { text: "Restart?", size: 30, x: 600, y: 400, color: White }

newPentagon : Vector2 -> Polygon
newPentagon = \center -> {
    sides: Sides.threePlus 2,
    rotation: 0.0,
    color: Silver,
    radius: initialPentagonRadius,
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
            |> \n -> n * initialPentagonRadius
        denom = Num.toF32 granularity
        num / denom

    newPolygon = { polygon & rotation, radius }

    # setting this too small results in no despawns
    despawnRadius = 1

    if newPolygon.radius < despawnRadius then
        Err Despawn
    else
        Ok { spawnedPolygon & polygon: newPolygon, age: newAge }

PlayerSlice model : {
    beat : F32,
    center : Vector2,
    playerRotation : F32,
    playerRadius : F32,
}model

playerPolygon : PlayerSlice m -> Polygon
playerPolygon = \model ->
    # reversed from polygons, normalized to between 0 and 1
    playerBeat = (-model.beat + 1.0) * 0.5

    sizeModifier = playerBeat * 1.5
    positionMultiplier = playerBeat * 0.05 + 1.0

    playerCenter =
        distance = model.playerRadius * positionMultiplier
        x = model.center.x + (Num.cos model.playerRotation) * distance
        y = model.center.y + (Num.sin model.playerRotation) * distance
        { x, y }

    {
        sides: Sides.threePlus 0,
        color: Fuchsia,
        rotation: model.playerRotation,
        center: playerCenter,
        radius: playerSize + sizeModifier,
    }

GameOverModel : {
    age : U64,
    animation : [Drifting F32, OfferRestart],
}

gameOverUpdate : Model, GameOverModel, [LeftClick]* -> Model
gameOverUpdate = \model, gameOver, click ->
    age = gameOver.age + 1
    offset = Num.toFrac age * 2
    animation =
        if offset < windowWidth then
            Drifting offset
        else
            OfferRestart

    when (animation, click) is
        (OfferRestart, LeftClick) -> newGame
        _ -> { model & screen: GameOver { age, animation } }
