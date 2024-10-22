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

import ascii.Ascii
import ascii.Char

# args to scripts seem broken on linux;
# https://roc.zulipchat.com/#narrow/channel/231634-beginners/topic/How.20to.20enable.20dbg.3F/near/473415831
# these paths could potentially move to the justfile if that's fixed
spriteSheetComplete =
    "./examples/assets/platformer/spritesheet_complete.xml"
spriteSheetModulePath =
    "./examples/platformer/Generated/Sprites.roc"

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
    absoluteXmlPath = Str.replaceFirst spriteSheetComplete "." (cwd |> Path.display)
    absoluteImagePath = Str.replaceLast absoluteXmlPath ".xml" ".png"

    imageExists = File.isFile! absoluteImagePath
    if imageExists then
        run! { absoluteXmlPath }
    else
        Stderr.line! "no matching image found at: $(absoluteImagePath)"

run : { absoluteXmlPath : Str } -> Task {} _
run = \{ absoluteXmlPath } ->
    atlas = loadSpriteAtlas! absoluteXmlPath
    imagePath =
        spriteSheetComplete
        |> Str.replaceFirst "./" ""
        |> Str.replaceLast ".xml" ".png"
    rocModule = generateRocModule { atlas, imagePath }

    File.writeUtf8! spriteSheetModulePath rocModule

    Stdout.line! "sprite atlas written to $(spriteSheetModulePath)"

generateRocModule : { atlas : TextureAtlas, imagePath : Str } -> Str
generateRocModule = \{ atlas, imagePath } ->
    asciiLiteral = \literal ->
        when Char.fromAsciiByte literal is
            Ok char -> char
            Err _unreachable -> crash "ascii literal"

    lowercaseAlphabet = List.range { start: At 97, end: At 122 }

    underscoreSubstitutions =
        charsToStr = \chars -> chars |> Ascii.fromChars |> Ascii.toStr

        List.map lowercaseAlphabet \ch ->
            char = asciiLiteral ch
            underscore = asciiLiteral 95
            replaceThis = charsToStr [underscore, char]
            withThis = charsToStr [Char.toUppercase char]

            (replaceThis, withThis)

    # replace something like camelCase_color with camelCaseColor
    # something like cammelCase_1 is unchanged
    camelCaseUnderscores = \spriteName ->
        List.walk underscoreSubstitutions spriteName \str, (replaceThis, withThis) ->
            Str.replaceEach str replaceThis withThis

    spriteNameToRocName = \spriteName ->
        spriteName
        |> camelCaseUnderscores
        |> Str.replaceEach "_" ""
        |> Str.replaceLast ".png" ""

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
        rect,
        $(spriteExports)
    ]

    import ray.RocRay exposing [Texture, Rectangle]

    ## the relative asset path to the sprite sheet image file
    imagePath : Str
    imagePath =
        "$(imagePath)"

    ## load the sprite sheet as a raylib texture
    load : Task Texture _
    load =
        RocRay.loadTexture imagePath

    ## remove non-rectangle attribute(s)
    rect : Sprite -> Rectangle
    rect = \\{ x, y, width, height } ->
        { x, y, width, height }

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
        when parseAtlasXml (Str.trim xml) is
            Ok parsed -> parsed
            Err err -> crash "error parsing $(path) sprite sheet xml: $(err)"

    Task.ok atlas

parseAtlasXml : Str -> Result TextureAtlas Str
parseAtlasXml = \spriteAtlasXml ->
    spriteAtlasXml
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

    parseSubTexture : [Element _ _ _] -> SubTexture
    parseSubTexture = \node ->
        when node is
            Element "SubTexture" attrs _children ->
                name =
                    List.findFirst attrs (\a -> a.name == "name")
                    |> Result.map (\a -> a.value)
                xResult = parseIntAttr { attrs, name: "x" }
                yResult = parseIntAttr { attrs, name: "y" }
                width = parseIntAttr { attrs, name: "width" }
                height = parseIntAttr { attrs, name: "height" }

                when { name, x: xResult, y: yResult, width, height } is
                    { name: Ok n, x: Ok x, y: Ok y, width: Ok w, height: Ok h } ->
                        { name: n, x, y, width: w, height: h }

                    weirdAttrs ->
                        crash "missing attributes on SubTexture: $(Inspect.toStr weirdAttrs)"

            Element elem _attrs _children ->
                crash "unexpected elem: $(elem)"

    # in the sprite atlas, the only text nodes are interstitial whitespace
    # we could handle that better in the xml parser
    noTextNodesJustElements : Xml.Node -> Result [Element _ _ _] [Text]
    noTextNodesJustElements = \node ->
        when node is
            Element elem attrs children ->
                childElems = List.keepOks children noTextNodesJustElements
                Ok (Element elem attrs childElems)

            Text _ ->
                Err Text

    subTextures : List SubTexture
    subTextures =
        when root is
            Element "TextureAtlas" _attrs children ->
                elements = List.keepOks children noTextNodesJustElements
                List.map elements parseSubTexture

            other -> crash "unexpected xml node: $(Inspect.toStr other)"

    Ok { subTextures }
