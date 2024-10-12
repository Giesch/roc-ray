set windows-shell := ["powershell.exe", "-NoLogo", "-Command"]

# list the available commands
list:
    just --list --unsorted

# build and run the executable
[windows]
dev app:
    $env:path = "$(pwd)\windows\bin;$($env:path)"; zig.exe build --release=fast -Dapp="{{app}}"
    .\zig-out\bin\rocray.exe

# install zig with winget and download roc binary to ./bin/
[windows]
setup:
    ./windows/setup.ps1

# clean the build directory
[windows]
clean:
    git clean -dfx -e windows\bin

