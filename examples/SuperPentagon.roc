app [main, Model] {
    ray: platform "../platform/main.roc",
}

import ray.RocRay exposing [Color, PlatformState, Vector2]

import SuperPentagon.Polygon.Sides as Sides
import SuperPentagon.Polygon as Polygon exposing [Polygon]
import SuperPentagon.Obstacle as Obstacle exposing [Obstacle]

# TODO
# - recent high score
#
# - more gameplay
#   - get faster/harder over time
#   - vary the obstacle shapes
#     - n sides
#     - n missing sides
#     - missing corners?
#
# - update platform
#   - merge upstream
#   - use platform state
#   - use keys? for pause?
#
# - high score screen (save on disk? input initials?)

main = { init, render }

Model : {
    screen : [Playing, GameOver GameOverModel],
    center : Vector2,
    frameCount : U64,
    spawnTimer : U64,
    obstacles : List Obstacle,
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
initialObstacleRadius = windowHeight * 0.9

init : Task Model {}
init =
    RocRay.setWindowSize! { width: windowWidth, height: windowHeight }
    RocRay.setWindowTitle! "Super Pentagon"
    RocRay.setTargetFPS! fps

    Task.ok newGame

newGame : Model
newGame =
    center = { x: windowWidth / 2, y: windowHeight / 2 }

    {
        screen: Playing,
        center,
        frameCount: 0,
        spawnTimer: 0,
        obstacles: [],
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

render : Model, PlatformState -> Task Model {}
render = \model, { frameCount, mouseButtons, mousePos } ->
    click = if Set.contains mouseButtons MouseButtonLeft then LeftClick else None

    newModel =
        when model.screen is
            Playing -> update { model, frameCount, mousePos }
            GameOver gameOver -> gameOverUpdate model gameOver click

    draw! (drawModel newModel)

    Task.ok newModel

update : { model : Model, frameCount : U64, mousePos : Vector2 } -> Model
update = \{ model, frameCount, mousePos } ->
    mouse = mousePos
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

    obstacles : List Obstacle
    obstacles =
        handleSpawn = \oldObstacles ->
            when spawn is
                None -> oldObstacles
                SpawnPentagon ->
                    List.append oldObstacles (pentagonObstacle model.center)

        updateAndDespawn = \oldObstacles ->
            List.keepOks oldObstacles \obs ->
                updateObstacle obs { deltaFrames, bpm: model.bpm }

        addBeatToPolygon = \polygon ->
            { polygon & radius: polygon.radius + beat * 10.0 }
        addBeatToObstacles = \polygons ->
            polygons |> List.map (\obs -> Obstacle.updatePolygon obs addBeatToPolygon)

        model.obstacles
        |> handleSpawn
        |> updateAndDespawn
        |> addBeatToObstacles

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
        obstacles,
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
        obstacleLines = List.joinMap model.obstacles Obstacle.edges
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
    obstacles : List Obstacle,
    score : U64,
}model

drawModel : DrawSlice m -> DrawModel
drawModel = \model ->
    player = playerPolygon model
    obstacleLines = List.joinMap model.obstacles Obstacle.lines
    { player, obstacleLines, score: model.score, beat: model.beat, screen: model.screen }

DrawModel : {
    screen : [Playing, GameOver GameOverModel],
    player : Polygon,
    obstacleLines : List { start : Vector2, end : Vector2, color : Color },
    score : U64,
    beat : F32,
}

draw : DrawModel -> Task {} {}
draw = \model ->
    Task.forEach! model.obstacleLines RocRay.drawLine

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
        RocRay.drawText! { text, size, x: margin + offset, y: margin, color: White }

    when model.screen is
        Playing -> drawScoreNumber { offset: 0 }
        GameOver { animation } ->
            when animation is
                Drifting offset -> drawScoreNumber { offset }
                OfferRestart -> drawRestart

drawRestart : Task {} _
drawRestart =
    RocRay.drawText { text: "Restart?", size: 30, x: 600, y: 400, color: White }

pentagonObstacle : Vector2 -> Obstacle
pentagonObstacle = \center ->
    polygon = {
        sides: Sides.threePlus 2,
        rotation: 0.0,
        color: Silver,
        radius: initialObstacleRadius,
        center,
    }
    gaps = [2, 4]
    Obstacle.new { polygon, gaps }

updateObstacle : Obstacle, { bpm : F32, deltaFrames : U64 } -> Result Obstacle [Despawn]
updateObstacle = \obstacle, { bpm, deltaFrames } ->
    age = Obstacle.age obstacle
    newAge = age + deltaFrames

    rotationDegrees = (bpm / 120) * Num.toF32 newAge
    rotation = (rotationDegrees / 360) * Num.tau

    radius =
        granularity = 600
        num =
            newAge
            |> Num.rem granularity
            |> \n -> initialObstacleRadius * Num.toF32 (granularity - n)
        denom = Num.toF32 granularity
        num / denom

    if radius < 1 then
        Err Despawn
    else
        obstacle
        |> Obstacle.updatePolygon \polygon -> { polygon & rotation, radius }
        |> Obstacle.setAge newAge
        |> Ok

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
