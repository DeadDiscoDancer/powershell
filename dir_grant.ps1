$cmd = 'powershell.exe'
$ApacheDir = "C:\Apache24"
$C4TDir = "C:\Check4Trick"
$User = Read-Host 'Enter username'
$CommandApacheDir = "icacls $ApacheDir /grant '$User':(OI)(CI)F /T"
$CommandC4TDir = "icacls $C4TDir /grant '$User':(OI)(CI)F /T"
cd C:\Windows\System32
Write-Output "Granting access to $ApacheDir for user: $User"
Start-Process $cmd -ArgumentList $CommandApacheDir -Verb RunAs
Write-Output "Access Granted! Dir: $ApacheDir , user: $User"
Write-Output "Granting access to $ApacheDir for user: $User"
Start-Process $cmd -ArgumentList $CommandC4TDir -Verb RunAs
Write-Output "Access Granted! Dir: $C4TDir , user: $User"
Write-Output "Done!"
Read-Host -Prompt "Press Enter to exit"