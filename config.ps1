#!/bin/ps1
New-Volume -DiskPath
Mount-DiskImage -Imagepath E:
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install nodejs
choco install dotnet
choco install git