app [Model, init, render] { rr: platform "../platform/main.roc" }

import rr.RocRay exposing [Vector2]
import rr.Mouse
import rr.Draw

Ball : { pos : Vector2, vel : Vector2 }

Model : {
    screen : [StartMenu, Playing],
    maxScore : I32,
    score : I32,
    ball : Ball,
    pos : F32,
}

width = 800
height = 600

paddle = 50
pw = paddle / 4
ballSize = 20

newBall = {
    pos: { x: width / 2, y: height / 2 },
    vel: { x: 5, y: 2 },
}

init : Task Model []
init =
    RocRay.setTargetFPS! 60
    RocRay.setDrawFPS! { fps: Visible }
    RocRay.setWindowSize! { width, height }
    RocRay.setWindowTitle! "Pong"

    Task.ok {
        screen: StartMenu,
        ball: newBall,
        pos: height / 2 - paddle / 2,
        score: 0,
        maxScore: 0,
    }

moveBall : Ball -> Ball
moveBall = \ball ->
    x = ball.pos.x + ball.vel.x
    y = ball.pos.y + ball.vel.y
    { ball & pos: { x, y } }

bounce : Ball, F32 -> Ball
bounce = \ball, pos ->
    { x, y } = ball.pos
    { x: vx, y: vy } = ball.vel

    (x2, vx2, vy2) =
        if x > width - ballSize then
            (width - ballSize, -vx * 1.1, vy)
        else if x < pw && y + ballSize > pos && y < pos + paddle then
            (pw, -vx * 1.1, vy * 1.1)
        else
            (x, vx, vy)

    (y2, vy3) =
        if y < 0 then
            (0, -vy2 * 1.1)
        else if y > height - ballSize then
            (height - ballSize, -vy2 * 1.1)
        else
            (y, vy2)

    { pos: { x: x2, y: y2 }, vel: { x: vx2, y: vy3 } }

render : Model, RocRay.PlatformState -> Task Model []
render = \model, state ->
    when model.screen is
        StartMenu ->
            # DRAW START MENU
            drawGameStartMenu! model

            if Mouse.pressed state.mouse.buttons.left then
                Task.ok { model & screen: Playing, score: 0 }
            else
                Task.ok model

        Playing ->
            # Increase the speed of the ball, starts getting crazy after a minute... just for a bit of fun
            RocRay.setTargetFPS! (60 + ((Num.toFrac state.frameCount) / 60 |> Num.floor |> Num.toI32))

            newModel = update model state
            drawGamePlaying! newModel state
            Task.ok newModel

update : Model, RocRay.PlatformState -> Model
update = \model, state ->
    ball = bounce (moveBall model.ball) model.pos
    newY = model.pos + (Num.toF32 state.mouse.position.y - model.pos) / 5

    if ball.pos.x <= 0 then
        maxScore = Num.max model.score model.maxScore
        { model & pos: newY, ball: newBall, maxScore, screen: StartMenu }
    else
        { model & pos: newY, ball: ball, score: model.score + 1 }

drawGameStartMenu : Model -> Task {} _
drawGameStartMenu = \model ->
    Draw.draw! Navy \{} ->
        maxScore = model.maxScore |> Num.toStr
        score = model.score |> Num.toStr

        Draw.text! { pos: { x: 50, y: 120 }, text: "Click to start", size: 20, color: White }
        Draw.text! { pos: { x: 50, y: 50 }, text: "Max Score: $(maxScore)", size: 20, color: White }
        Draw.text! { pos: { x: 50, y: 80 }, text: "Last Score: $(score)", size: 20, color: White }

drawGamePlaying : Model, RocRay.PlatformState -> Task {} _
drawGamePlaying = \model, { mouse } ->
    Draw.draw! Navy \{} ->
        score = model.score |> Num.toStr

        Draw.text! { pos: { x: 50, y: 50 }, text: "Score: $(score)", size: 20, color: White }

        drawPaddle! model
        drawBall! model.ball

        drawCrossHair! mouse.position

drawPaddle : Model -> Task {} []
drawPaddle = \{ pos } ->
    rect = { x: 0, y: pos, width: pw, height: paddle }
    Draw.rectangle! { rect, color: Aqua }

drawBall : Ball -> Task {} []
drawBall = \ball ->
    rect = { x: ball.pos.x, y: ball.pos.y, width: ballSize, height: ballSize }
    Draw.rectangle! { rect, color: Green }

drawCrossHair : Vector2 -> Task {} []
drawCrossHair = \mousePos ->
    Draw.line! {
        start: { x: mousePos.x, y: 0 },
        end: { x: mousePos.x, y: height },
        color: Yellow,
    }

    Draw.line! {
        start: { x: 0, y: Num.toF32 mousePos.y },
        end: { x: width, y: Num.toF32 mousePos.y },
        color: Yellow,
    }
