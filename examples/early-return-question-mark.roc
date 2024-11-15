app [Model, init!, render!] { rr: platform "../platform/main.roc" }

import rr.RocRay

Model : {}

init! : {} => Result Model _
init! = \{} ->
    _message =
        RocRay.loadFileToStr!? "examples/assets/reload-text/message.txt"

    # a second ? on an effectful function causes a compile error
    _messageAgain =
        RocRay.loadFileToStr!? "examples/assets/reload-text/message.txt"

    Ok {}

render! : Model, RocRay.PlatformState => Result Model []
render! = \model, _ ->
    Ok model
