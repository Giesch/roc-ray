set windows-shell := ["powershell.exe", "-NoLogo", "-Command"]

# the linux commands assume zig 0.13.0 and a recent roc are on the path
# the windows commands include a 'setup' recipe to install them

# list the available commands
list:
    just --list --unsorted

[linux]
dev app="examples/SuperPentagon.roc":
    zig build --release=fast -Dapp="{{app}}"
    ./zig-out/bin/rocray

# build and run the executable
[windows]
dev app="examples/SuperPentagon.roc":
    $env:path = "$(pwd)\windows\bin;$($env:path)"; zig.exe build --release=fast -Dapp="{{app}}"
    .\zig-out\bin\rocray.exe

# install zig with winget and download roc binary to ./windows/bin/
[windows]
setup:
    ./windows/setup.ps1

# clean build artifacts
[windows]
clean:
    git clean -dfx -e windows\bin

# clean build artifacts
[linux]
clean:
    git clean -dfx

[linux]
format:
    roc format

[windows]
format:
    $env:path = "$(pwd)\windows\bin;$($env:path)"; roc format

[linux]
check app:
    roc check {{app}}
