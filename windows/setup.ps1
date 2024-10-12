# install zig 0.13.0 
winget list -q zig.zig | Out-Null;
if (!$?) {
  winget install zig.zig --version 0.13.0 
}

$url = "https://github.com/lukewilliamboswell/roc/releases/download/windows-20241011/roc.exe"
$path = "$PSScriptRoot/bin/roc.exe"

# download roc to /windows/bin
if (!(Test-Path $path)) {
  New-Item -ItemType Directory -Force -Path $path
  $wc = New-Object System.Net.WebClient
  $wc.DownloadFile($url, $path) 
}
