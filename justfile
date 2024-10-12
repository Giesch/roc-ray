set windows-shell := ["powershell.exe", "-NoLogo", "-Command"]

# list the available commands
list:
    just --list --unsorted

# build and run the executable
[windows]
dev:
    $env:path = "$(pwd)\bin\windows;$($env:path)"; zig.exe build --release=fast -Dapp="examples/basic-shapes.roc"; .\zig-out\bin\rocray.exe

# clean the build directory
clean:
    git clean -dfx -e bin

[windows]
setup:
    New-Item -ItemType Directory -Force -Path ./bin/windows
    $wc = New-Object System.Net.WebClient; $wc.DownloadFile("https://github.com/lukewilliamboswell/roc/releases/download/windows-20241011/roc.exe", "./bin/windows/roc.exe")
