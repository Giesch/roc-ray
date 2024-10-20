app [main, Model] {
    ray: platform "../platform/main.roc",
    parser: "https://github.com/lukewilliamboswell/roc-parser/releases/download/0.8.0/PCkJq9IGyIpMfwuW-9hjfXd6x-bHb1_OZdacogpBcPM.tar.br",
}

import ray.RocRay exposing [PlatformState, Texture, Rectangle]
import ray.RocRay.Keys as Keys

import parser.Xml
import parser.String

main : RocRay.Program Model _
main = { init, render }

Model : {
    playersAtlas : TextureAtlas,
    playersSheet : Texture,
    sprites : Sprites,
    player : Player,
    timestampMillis : U64,
}

assetsDir = "examples/assets/kenney_abstract-platformer"

windowWidth = 800
windowHeight = 600

Sprites : {
    walk : List SubTexture,
    stand : List SubTexture,
}

Player : {
    x : F32,
    y : F32,
    intent : Intent,
    animation : Animation,
}

Facing : [Right, Left]
Intent : [Idle Facing, Walk Facing]

Animation : [
    Standing U64,
    Walking U64,
]

init : Task Model _
init =
    RocRay.setTargetFPS! 60
    RocRay.setWindowSize! { width: windowWidth, height: windowHeight }
    RocRay.setWindowTitle! "Platformer Example"
    RocRay.setBackgroundColor! White

    (playersAtlas, playersSheet) = loadSpriteAtlas! "spritesheet_players"

    requireSubTexture = \name ->
        playersAtlas.subTextures
        |> List.findFirst \st -> st.name == name
        |> \result ->
            when result is
                Ok sub -> sub
                Err _ -> crash "expected SubTexture $(name)"

    stand : List SubTexture
    stand = [
        requireSubTexture "playerGreen_walk1.png",
        requireSubTexture "playerGreen_stand.png",
        requireSubTexture "playerGreen_up1.png",
    ]

    walk : List SubTexture
    walk =
        ["1", "2", "3"]
        |> List.map \n -> Str.joinWith ["playerGreen_walk", n, ".png"] ""
        |> List.map requireSubTexture

    sprites : Sprites
    sprites = { walk, stand }

    model : Model
    model = {
        playersAtlas,
        playersSheet,
        player: {
            x: windowWidth / 2.0,
            y: windowHeight / 2.0,
            intent: Idle Right,
            animation: Standing 0,
        },
        sprites,
        timestampMillis: 0,
    }

    Task.ok model

loadSpriteAtlas : Str -> Task (TextureAtlas, Texture) _
loadSpriteAtlas = \name ->
    xml = RocRay.loadFileToStr! "$(assetsDir)/Spritesheet/$(name).xml"

    atlas =
        when parseSheetXml (Str.trim xml) is
            Ok parsed -> parsed
            Err err -> crash "error parsing $(name) sprite sheet xml: $(err)"

    sheet =
        RocRay.loadTexture! "$(assetsDir)/Spritesheet/$(name).png"

    Task.ok (atlas, sheet)

render : Model, PlatformState -> Task Model _
render = \model, state ->
    newModel = update! model state
    drawPlayer! newModel
    Task.ok newModel

update : Model, PlatformState -> Task Model _
update = \model, state ->
    timestampMillis = state.timestampMillis
    deltaMillis = timestampMillis - model.timestampMillis
    deltaTime = Num.toF32 deltaMillis

    intent = readInput! model.player state

    xMove =
        when intent is
            Walk Right -> 1.0
            Walk Left -> -1.0
            Idle _facing -> 0.0
    runSpeed = 0.5

    animation =
        when (intent, model.player.animation) is
            (Idle _facing, Standing millis) -> Standing (millis + deltaMillis)
            (Idle _facing, _other) -> Standing 0
            (Walk _facing, Walking millis) -> Walking (millis + deltaMillis)
            (Walk _facing, _other) -> Walking 0

    oldPlayer = model.player
    newPlayer = { oldPlayer &
        intent,
        animation,
        x: oldPlayer.x + xMove * runSpeed * deltaTime,
    }

    Task.ok { model & player: newPlayer, timestampMillis }

drawPlayer : Model -> Task {} _
drawPlayer = \model ->
    flipFacing = \rect ->
        when playerFacing model.player is
            Right -> rect
            Left -> { rect & width: -rect.width }

    animation = model.player.animation

    sprite =
        when animation is
            Standing millis ->
                longStep = (millis // 1000) % 12
                step =
                    when longStep is
                        forward if forward < 4 -> 0
                        camera if camera < 6 -> 1
                        forward if forward < 10 -> 0
                        _up -> 2
                unsafeGet model.sprites.stand step "standing sprite"

            Walking millis ->
                mappedSteps = [0, 1, 2, 1]
                mappedStep = (millis // 100) % 4
                step = unsafeGet mappedSteps mappedStep "walking sprite mapping"
                unsafeGet model.sprites.walk step "walking sprite"

    source : Rectangle
    source =
        sprite
        |> minusName
        |> flipFacing

    texture = model.playersSheet
    pos = { x: model.player.x, y: model.player.y }
    tint = White
    RocRay.drawTextureRec { source, texture, pos, tint }

playerFacing : Player -> Facing
playerFacing = \player ->
    when player.intent is
        Idle facing -> facing
        Walk facing -> facing

readInput : Player, PlatformState -> Task Intent _
readInput = \player, { keys } ->
    newPlayer =
        if Keys.anyDown keys [KeyLeft, KeyA] then
            Walk Left
        else if Keys.anyDown keys [KeyRight, KeyD] then
            Walk Right
        else
            Idle (playerFacing player)

    Task.ok newPlayer

minusName : SubTexture -> Rectangle
minusName = \{ x, y, width, height } -> { x, y, width, height }

TextureAtlas : {
    subTextures : List SubTexture,
}

SubTexture : {
    name : Str,
    x : F32,
    y : F32,
    width : F32,
    height : F32,
}

parseSheetXml : Str -> Result TextureAtlas Str
parseSheetXml = \spriteSheetXml ->
    spriteSheetXml
    |> Str.trim
    |> \str -> String.parseStr Xml.xmlParser str
    |> Result.try \doc -> xmlTextureAtlas doc.root
    |> Result.mapErr \err ->
        when err is
            ParsingFailure f -> "ParsingFailure: $(f)"
            ParsingIncomplete rem -> "ParsingIncomplete: $(rem)"

xmlTextureAtlas : Xml.Node -> Result TextureAtlas _
xmlTextureAtlas = \root ->
    parseIntAttr = \{ attrs, name } ->
        List.findFirst attrs (\a -> a.name == name)
        |> Result.map \a -> a.value
        |> Result.try Str.toF32

    gatherErrors : _ -> Result SubTexture [ParsingFailure Str]
    gatherErrors = \results ->
        when results is
            { name: Ok n, x: Ok x, y: Ok y, width: Ok w, height: Ok h } ->
                Ok { name: n, x, y, width: w, height: h }

            _ehhh ->
                Err (ParsingFailure "missing attributes on SubTexture")

    parseSubTexture : Xml.Node -> Result [ST SubTexture, TextNode Str] _
    parseSubTexture = \node ->
        when node is
            Element "SubTexture" attrs _children ->
                name =
                    List.findFirst attrs (\a -> a.name == "name")
                    |> Result.map (\a -> a.value)
                x = parseIntAttr { attrs, name: "x" }
                y = parseIntAttr { attrs, name: "y" }
                width = parseIntAttr { attrs, name: "width" }
                height = parseIntAttr { attrs, name: "height" }
                gatherErrors { name, x, y, width, height } |> Result.map ST

            Element elem _attrs _children ->
                Err (ParsingFailure "unexpected elem: $(elem)")

            Text t -> Ok (TextNode t)

    subTextureResult =
        when root is
            Element "TextureAtlas" _attrs children ->
                List.mapTry children parseSubTexture

            Element elem _attrs _children ->
                Err (ParsingFailure "unexpected elem: $(elem)")

            Text content ->
                Err (ParsingFailure "unexpected text node: $(content)")

    subTextureResult
    |> Result.map \nodes ->
        List.keepOks nodes \n ->
            when n is
                ST subTexture -> Ok subTexture
                TextNode t -> Err t
    |> Result.map \subTextures -> { subTextures }

unsafeGet : List a, U64, Str -> a
unsafeGet = \list, i, message ->
    when List.get list i is
        Ok item -> item
        Err _ -> crash message
