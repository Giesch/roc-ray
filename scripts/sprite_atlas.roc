#!/usr/bin/env -S roc --linker=legacy
app [main] {
    cli: platform "https://github.com/roc-lang/basic-cli/releases/download/0.15.0/SlwdbJ-3GR7uBWQo6zlmYWNYOxnvo8r6YABXD-45UOw.tar.br",
    parser: "https://github.com/lukewilliamboswell/roc-parser/releases/download/0.8.0/PCkJq9IGyIpMfwuW-9hjfXd6x-bHb1_OZdacogpBcPM.tar.br",
    ascii: "https://github.com/Hasnep/roc-ascii/releases/download/v0.2.0/F8xZFTEm1fA7RF6OA1jl6V_ef_roDHfwGsBva29RxEg.tar.br",
}

import cli.Env
import cli.File
import cli.Path
import cli.Stdout
import cli.Stderr

import parser.Xml
import parser.String

# args to scripts seem broken on linux;
# https://roc.zulipchat.com/#narrow/channel/231634-beginners/topic/How.20to.20enable.20dbg.3F/near/473415831
# these paths could potentially move to the justfile if that's fixed
spriteSheetComplete =
    "./examples/assets/kenney_abstract-platformer/Spritesheet/spritesheet_complete.xml"
spriteSheetModulePath =
    "./examples/Platformer/Generated/SpriteAtlas.roc"

# ShoeBox XML TextureAtlas
TextureAtlas : {
    subTextures : List SubTexture,
}

# ShoeBox XML SubTexture
SubTexture : {
    name : Str,
    x : F32,
    y : F32,
    width : F32,
    height : F32,
}

main : Task {} _
main =
    cwd = Env.cwd!
    # there has to be a better way to do this
    xmlPath = Str.replaceFirst spriteSheetComplete "." (cwd |> Path.display)
    imagePath = Str.replaceLast xmlPath ".xml" ".png"

    imageExists = File.isFile! imagePath
    if imageExists then
        run! { xmlPath, imagePath }
    else
        Stderr.line! "no matching image found at: $(imagePath)"

run : { xmlPath : Str, imagePath : Str } -> Task {} _
run = \{ xmlPath, imagePath } ->
    atlas = loadSpriteAtlas! xmlPath
    rocModule = generateRocModule { atlas, imagePath }

    File.writeUtf8! spriteSheetModulePath rocModule

    Stdout.line! "SpriteAtlas.roc written to $(spriteSheetModulePath)"

generateRocModule : { atlas : TextureAtlas, imagePath : Str } -> Str
generateRocModule = \{ atlas, imagePath } ->
    spriteNameToRocName = \str ->
        str |> Str.replaceEach "_" "" |> Str.replaceLast ".png" ""

    spriteExports =
        atlas.subTextures
        |> List.map \sprite -> spriteNameToRocName sprite.name
        |> Str.joinWith ", "

    spriteDefinition : SubTexture -> Str
    spriteDefinition = \sprite ->
        rocName = spriteNameToRocName sprite.name

        """
        $(rocName) : Sprite
        $(rocName) =
            {
                name : "$(sprite.name)",
                x: $(Num.toStr sprite.x),
                y: $(Num.toStr sprite.y),
                width: $(Num.toStr sprite.width),
                height: $(Num.toStr sprite.height),
            }
        """

    spriteDefinitions : Str
    spriteDefinitions =
        atlas.subTextures
        |> List.map spriteDefinition
        |> Str.joinWith "\n\n"

    """
    module [
        Sprite,
        imagePath,
        load,
        $(spriteExports)
    ]

    import ray.RocRay exposing [Texture]

    ## the relative asset path to the sprite sheet image file
    imagePath : Str
    imagePath = "$(imagePath)"

    load : Task Texture _
    load = RocRay.loadTexture imagePath

    ## an offset to an image in the sprite sheet
    Sprite : {
        name : Str,
        x : F32,
        y : F32,
        width : F32,
        height : F32,
    }

    $(spriteDefinitions)
    """

loadSpriteAtlas : Str -> Task TextureAtlas _
loadSpriteAtlas = \path ->
    xml = File.readUtf8! path

    atlas =
        when parseSheetXml (Str.trim xml) is
            Ok parsed -> parsed
            Err err -> crash "error parsing $(path) sprite sheet xml: $(err)"

    Task.ok atlas

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
