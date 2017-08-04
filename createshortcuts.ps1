# Create a Shortcut with Windows PowerShell
$TargetFile = "$env:SystemRoot\System32\notepad.exe"
$ShortcutFile = "$env:userprofile\Desktop\Notepad.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Save()

$TargetFile = "$env:SystemRoot\System32\taskmgr.exe"
$ShortcutFile = "$env:userprofile\Desktop\taskmgr.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Save()

$TargetFile = "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe-incognito"
$ShortcutFile = "$env:userprofile\Desktop\chrome.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Save()