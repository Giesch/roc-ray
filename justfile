set windows-shell := ["powershell.exe", "-NoLogo", "-Command"]

# the linux commands assume zig 0.13.0 and a recent roc are on the path
# the windows commands include a 'setup' recipe to install them

# list the available commands
list:
    just --list --unsorted

[linux]
dev app:
    zig build --release=fast -Dapp="{{app}}"
    ./zig-out/bin/rocray

# build and run the executable
[windows]
dev app:
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
