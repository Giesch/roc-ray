set windows-shell := ["powershell.exe", "-NoLogo", "-Command"]

# list the available commands
list:
    just --list --unsorted

# build and run the executable
[windows]
dev:
    $env:path = "$(pwd)\bin;$($env:path)"; zig.exe build --release=fast -Dapp="examples/basic-shapes.roc"; .\zig-out\bin\rocray.exe

# clean the build directory
clean:
    git clean -dfx -e windows/bin

# install zig with winget and download roc binary to ./bin/
[windows]
setup:
    ./windows/setup.ps1
