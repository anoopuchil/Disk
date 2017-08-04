#Run as Admin
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

#Variable for current path
$scriptpath = $myInvocation.MyCommand.Path
$dir = Split-Path $scriptpath


$outputFile= "$dir\onlyone.xml"
New-Item -ItemType File $outputFile -Force


export-startlayout –path "$outputFile"

