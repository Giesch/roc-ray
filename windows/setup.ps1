# install zig 0.13.0 
winget list -q zig.zig | Out-Null;
if (!$?) {
  winget install zig.zig --version 0.13.0 
}

$url = "https://github.com/lukewilliamboswell/roc/releases/download/windows-20241011/roc.exe"
$binDir = "$PSScriptRoot\bin\" 
$path = "$binDir\roc.exe"

echo $url
echo $path

# download roc to /windows/bin
if (!(Test-Path $path)) {
  New-Item -ItemType Directory -Force -Path $binDir
  $wc = New-Object System.Net.WebClient
  $wc.DownloadFile($url, $path) 
}
