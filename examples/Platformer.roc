app [main, Model] {
    ray: platform "../platform/main.roc",
    parser: "https://github.com/lukewilliamboswell/roc-parser/releases/download/0.8.0/PCkJq9IGyIpMfwuW-9hjfXd6x-bHb1_OZdacogpBcPM.tar.br",
}

import ray.RocRay exposing [PlatformState, Texture]
import parser.Xml
import parser.String

# import "../examples/assets/kenney_abstract-platformer/Spritesheet/spritesheet_players.xml" as playerSheetXml : Str

main : RocRay.Program Model _
main = { init, render }

Model : {
    playersAtlas : TextureAtlas,
    playersSheet : Texture,
}

assetsDir = "examples/assets/kenney_abstract-platformer"

windowWidth = 800
windowHeight = 600

init =
    RocRay.setTargetFPS! 60
    RocRay.setWindowSize! { width: windowWidth, height: windowHeight }
    RocRay.setWindowTitle! "Platformer Example"
    RocRay.setBackgroundColor! White

    (playersAtlas, playersSheet) = loadSpriteAtlas! "spritesheet_players"

    Task.ok {
        playersAtlas,
        playersSheet,
    }

loadSpriteAtlas : Str -> Task _ _
loadSpriteAtlas = \name ->
    xml : Str
    xml = RocRay.loadFileToStr! "$(assetsDir)/Spritesheet/$(name).xml"

    atlas =
        when parseSheetXml (Str.trim xml) is
            Ok parsed -> parsed
            Err err -> crash "error parsing $(name) sprite sheet xml: $(err)"

    sheet =
        RocRay.loadTexture! "$(assetsDir)/Spritesheet/$(name).png"

    Task.ok (atlas, sheet)

render : Model, PlatformState -> Task Model _
render = \model, _state ->
    sources = List.map model.playersAtlas.subTextures \{ x, y, width, height } ->
        { x, y, width, height }
    Task.forEach! sources \source ->
        RocRay.drawTextureRec {
            source,
            texture: model.playersSheet,
            pos: { x: source.x, y: source.y },
            tint: Gray,
        }

    Task.ok model

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
    String.parseStr Xml.xmlParser spriteSheetXml
    |> Result.try \doc -> xmlTextureAtlas doc.root
    |> Result.mapErr \e ->
        when e is
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

# TODO for xml parser
# handle trailing whitespace
# handle comments
# random text node?
