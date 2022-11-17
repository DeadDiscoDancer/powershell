$Curdate = Get-Date -Format "yyyyMMdd"
$Timeout = 10
$Files_eq = Get-ChildItem -Path "D:\check4trick_vtbcam\Server\binEQ\logs\" -Filter "*.log" -exclude errors.latest.log -Recurse -File | where Name -NotMatch "daily"
Write-Output "Stopping EQ market service..."
Stop-Service Check4Trick_EQ -Force -Passthru
Start-Sleep -Seconds $Timeout
Write-Output "Check4Trick_EQ service is stopped."

Write-Output "Compressing log archives..."
ForEach ($File in $Files_eq) {
	$File | Compress-Archive -DestinationPath "$($File.fullname)_$Curdate.zip"
}
Write-Output "EQ logs compress complete!"
Start-Sleep -Seconds $Timeout

Invoke-Expression "D:\Scripts\ziparch_vtbcam.ps1"

Write-Output "Removing log files from main directory..."
ForEach ($File in $Files_eq) {
	$File | Remove-Item 
}
Write-Output "EQ logs were removed."
Start-Sleep -Seconds $Timeout

Write-Output "Starting EQ market service..."
Start-Service Check4Trick_EQ -Passthru
Write-Output "Check4Trick_EQ service is started."

Write-Output "Done!"