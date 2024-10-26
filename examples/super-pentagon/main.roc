app [Model, init, render] { rr: platform "../../platform/main.roc" }

import rr.RocRay exposing [Color, PlatformState, Vector2]
import rr.Mouse
import rr.Draw

import Sides
import Polygon exposing [Polygon]
import Obstacle exposing [Obstacle]

# TODO
# - levels in yaml or something
#   play from any point in the song (in level description?)
#
# - more gameplay
#   - get harder over time
#   - vary the obstacle shapes
#     - n sides
#     - n missing sides
#     - missing corners?
#
# - update platform
#   - merge upstream
#   - use platform state
#   - use keys? for pause?

Model : {
    screen : [Playing, GameOver GameOverModel],
    center : Vector2,
    frameCount : U64,
    spawnTimer : U64,
    obstacles : List Obstacle,
    playerRotation : F32,
    bpm : F32,
    beat : F32,
    beatDirection : [Up, Down],
    score : U64,
    timestampMillis : U64,
}

# frames per second
fps : I32
fps = 60

windowWidth = 800f32
windowHeight = 600f32

initialBpm = 120
initialObstacleRadius = windowHeight * 0.9

# base radius used for the player's triangle
playerSize = 10.0
# player's distance from the center of the screen
playerPositionRadius = 80.0

init : Task Model []
init =
    RocRay.initWindow! {
        title: "Super Pentagon",
        width: windowWidth,
        height: windowHeight,
    }
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
        playerRotation: -Num.pi / 2,
        bpm: initialBpm,
        beat: 0.0,
        beatDirection: Up,
        score: 0,
        timestampMillis: 0,
    }

# spawn a new polygon every n millis
spawnRate = 5000

render : Model, PlatformState -> Task Model []
render = \model, { frameCount, mouse, timestampMillis } ->
    newModel =
        when model.screen is
            Playing -> update { model, frameCount, mouse, timestampMillis }
            GameOver gameOver ->
                leftMouse = mouse.buttons.left
                gameOverUpdate model gameOver { leftMouse, timestampMillis }

    draw! (drawModel newModel)

    Task.ok newModel

update :
    {
        model : Model,
        frameCount : U64,
        mouse : { position : Vector2 }m,
        timestampMillis : U64,
    }
    -> Model
update = \{ model, frameCount, mouse, timestampMillis } ->
    deltaMillis = timestampMillis - model.timestampMillis

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
        tickedTimer = model.spawnTimer + deltaMillis
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
                updateObstacle obs { deltaMillis, bpm: model.bpm }

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
        clamped = clamp mouse.position.x { min, max }
        (clamped - mid) / intentRange

    playerSpeed = 2 / 360
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
        beat,
        beatDirection,
        score,
        timestampMillis,
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

draw : DrawModel -> Task {} []
draw = \model ->
    Draw.draw! Black \{} ->
        Task.forEach! model.obstacleLines Draw.line

        player = model.player
        playerColor =
            when model.screen is
                Playing -> player.color
                _ -> Red
        Polygon.draw! { player & color: playerColor }

        drawScore! model

drawScore : DrawModel -> Task {} []
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
        pos = { x: margin + offset, y: margin }
        Draw.text! { text, size, pos, color: White }

    when model.screen is
        Playing -> drawScoreNumber! { offset: 0 }
        GameOver { animation } ->
            when animation is
                Drifting offset -> drawScoreNumber! { offset }
                OfferRestart ->
                    pos = { x: 600, y: 400 }
                    Draw.text! { text: "Restart?", size: 30, pos, color: White }

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

updateObstacle : Obstacle, { bpm : F32, deltaMillis : U64 } -> Result Obstacle [Despawn]
updateObstacle = \obstacle, { bpm, deltaMillis } ->
    age = Obstacle.age obstacle
    newAge = age + deltaMillis

    ageSeconds = Num.toF32 newAge / 1000
    rotationDegrees = bpm * ageSeconds / 2
    rotation = (rotationDegrees / 360) * Num.tau

    radius =
        granularity = 10_000
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
}model

playerPolygon : PlayerSlice m -> Polygon
playerPolygon = \model ->
    # reversed from polygons, normalized to between 0 and 1
    playerBeat = (-model.beat + 1.0) * 0.5

    sizeModifier = playerBeat * 1.5
    positionMultiplier = playerBeat * 0.05 + 1.0

    playerCenter =
        distance = playerPositionRadius * positionMultiplier
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

gameOverUpdate : Model, GameOverModel, { timestampMillis : U64, leftMouse : Mouse.ButtonState } -> Model
gameOverUpdate = \model, gameOver, { timestampMillis, leftMouse } ->
    deltaMillis = timestampMillis - model.timestampMillis
    age = gameOver.age + deltaMillis
    offset = (Num.toF32 age * 60 / 1000) * 2
    animation =
        if offset < windowWidth then
            Drifting offset
        else
            OfferRestart

    when (animation, leftMouse) is
        (OfferRestart, Pressed) -> newGame
        _ -> { model & timestampMillis, screen: GameOver { age, animation } }

