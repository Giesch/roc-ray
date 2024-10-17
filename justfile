set windows-shell := ["powershell.exe", "-NoLogo", "-Command"]

# the linux commands assume zig 0.13.0 and a recent roc are on the path
# the windows commands include a 'setup' recipe to install them

# list the available commands
list:
    just --list --unsorted


# install zig with winget and download roc binary to ./windows/bin/
[windows]
setup:
    ./windows/setup.ps1


# build and run the executable
[windows]
dev app="examples/SuperPentagon.roc":
    $env:path = "$(pwd)\windows\bin;$($env:path)"; roc build --no-link --output app.lib {{app}}
    cargo run

# build and run the executable
[linux]
dev app="examples/SuperPentagon.roc":
    roc check {{app}}
    roc build --no-link --output app.o {{app}}
    cargo run


# clean build artifacts
[windows]
clean:
    git clean -dfx -e windows\bin

# clean build artifacts
[linux]
clean:
    git clean -dfx


[windows]
check app="examples/SuperPentagon.roc":
    $env:path = "$(pwd)\windows\bin;$($env:path)"; roc check {{app}}

[linux]
check app="examples/SuperPentagon.roc":
    roc check {{app}}


[windows]
format file:
    $env:path = "$(pwd)\windows\bin;$($env:path)"; roc format {{file}}

[linux]
format file:
    roc format {{file}}
