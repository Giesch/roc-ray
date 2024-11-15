app [Model, init!, render!] { rr: platform "../platform/main.roc" }

import rr.RocRay

Model : {}

init! : {} => Result Model _
init! = \{} ->
    _message =
        try RocRay.loadFileToStr! "examples/assets/reload-text/message.txt"

    # a second try on a on an effectful function passes check but causes a compiler crash
    _messageAgain =
        try RocRay.loadFileToStr! "examples/assets/reload-text/message.txt"

    Ok {}

render! : Model, RocRay.PlatformState => Result Model []
render! = \model, _ ->
    Ok model
