#Date 8/4/2017

#Run as Admin
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }


#Variable for Output File Path to current desktop (Old; for research)
#$UserPath = "$($env:USERPROFILE)\Desktop\$env:computername.printerExport"


#Variable for current path
$scriptpath = $myInvocation.MyCommand.Path
$dir = Split-Path $scriptpath

#Default variable for output file
$Fname=$env:computername



gpresult /r /scope:computer 																				| Out-File $dir\$fname.txt -append
ipconfig /all 																								| Out-File $dir\$fname.txt -append

#List Connected Printers
get-printer																									| Out-File $dir\$fname.txt -append

#List Mapped Shared Drives 
Get-WmiObject -Class Win32_MappedLogicalDisk | select Name, ProviderName									| Out-File $dir\$fname.txt -append


#List Users that are Admins on this computer
$userToFind = $args[0] 
$administratorsAccount = Get-WmiObject Win32_Group -filter "LocalAccount=True AND SID='S-1-5-32-544'" 
$administratorQuery = "GroupComponent = `"Win32_Group.Domain='" + $administratorsAccount.Domain + "',NAME='" + $administratorsAccount.Name + "'`"" 
$user = Get-WmiObject Win32_GroupUser -filter $administratorQuery | select PartComponent |where {$_ -match $userToFind} 
$user 																										| Out-File $dir\$fname.txt -append


pause