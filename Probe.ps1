#Run as Admin
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

#Increment Counter

$incre = 0

function addthis() {
    #Add this

    $global:incre++
    
}




#Variable for current path
$scriptpath = $myInvocation.MyCommand.Path
$dir = Split-Path $scriptpath

#Default variable for output file
$Fname=$env:computername

#WIP:  {Write-Progress -Activity "Search in Progress" -Status "Running Script $incre" -PercentComplete(($incre/5)*100)}


#gpresult
addthis
gpresult /r /scope:computer 																				| Out-File $dir\$fname.txt -append

#Network Info
addthis
Get-WmiObject win32_networkadapterconfiguration | select INDEX,DESCRIPTION,MACADDRESS,IPADDRESS	     		| Out-File $dir\$fname.txt -append

#List Connected Printers
addthis
get-printer | Select NAME,DRIVERNAME,PORTNAME																| Out-File $dir\$fname.txt -append

#List Mapped Shared Drives 
addthis
Get-WmiObject -Class Win32_MappedLogicalDisk | select NAME, PROVIDERNAME									| Out-File $dir\$fname.txt -append


#List Users on this computer
addthis
Get-WmiObject -Class Win32_UserAccount | Select CAPTION,DOMAIN,NAME,FULLNAME								| Out-File $dir\$fname.txt -append

Write-Host "Probe Complete!"