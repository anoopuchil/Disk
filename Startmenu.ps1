#Run as Admin
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }


$scriptDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent


# Startmenu

Import-StartLayout -LayoutPath "$scriptDir\starttest.xml" -mountpath c:\

pause