$LastWrite = (get-date).AddDays(-1)
$Timeout = 5
$Files_cur = Get-ChildItem -Path "D:\check4trick\Server\binCUR\server_logs" -Filter "*.log" -Recurse -File | Where-Object {$_.LastWriteTime -le $LastWrite}
$Files_eq = Get-ChildItem -Path "D:\check4trick\Server\binEQ\server_logs" -Filter "*.log" -Recurse -File | Where-Object {$_.LastWriteTime -le $LastWrite}
$Files_fo = Get-ChildItem -Path "D:\check4trick\Server\binFO\server_logs" -Filter "*.log" -Recurse -File | Where-Object {$_.LastWriteTime -le $LastWrite}
$Files_aml = Get-ChildItem -Path "D:\check4trick\Server\binAML\server_logs" -Filter "*.log" -Recurse -File | Where-Object {$_.LastWriteTime -le $LastWrite}
$Files_all = Get-ChildItem -Path "D:\check4trick\Server\binALL\server_logs" -Filter "*.log" -Recurse -File | Where-Object {$_.LastWriteTime -le $LastWrite}

ForEach ($File in $Files_cur) {
	$File | Compress-Archive -DestinationPath "$($File.fullname).zip"
}
Write-Output "CUR logs compress complete!"
Start-Sleep -Seconds $Timeout

ForEach ($File in $Files_eq) {
	$File | Compress-Archive -DestinationPath "$($File.fullname).zip"
}
Write-Output "EQ logs compress complete!"
Start-Sleep -Seconds $Timeout

ForEach ($File in $Files_fo) {
	$File | Compress-Archive -DestinationPath "$($File.fullname).zip"
}
Write-Output "FO logs compress complete!"
Start-Sleep -Seconds $Timeout

ForEach ($File in $Files_aml) {
	$File | Compress-Archive -DestinationPath "$($File.fullname).zip"
}
Write-Output "AML logs compress complete!"
Start-Sleep -Seconds $Timeout

ForEach ($File in $Files_all) {
	$File | Compress-Archive -DestinationPath "$($File.fullname).zip"
}
Write-Output "ALL logs compress complete!"
Start-Sleep -Seconds $Timeout

Invoke-Expression "D:\Scripts\ziparch.ps1"

ForEach ($File in $Files_cur) {
	$File | Remove-Item 
}
Write-Output "CUR logs removal complete!"
Start-Sleep -Seconds $Timeout

ForEach ($File in $Files_eq) {
	$File | Remove-Item 
}
Write-Output "EQ logs removal complete!"
Start-Sleep -Seconds $Timeout

ForEach ($File in $Files_fo) {
	$File | Remove-Item 
}
Write-Output "FO logs removal complete!"
Start-Sleep -Seconds $Timeout

ForEach ($File in $Files_aml) {
	$File | Remove-Item 
}
Write-Output "AML logs removal complete!"
Start-Sleep -Seconds $Timeout

ForEach ($File in $Files_all) {
	$File | Remove-Item 
}
Write-Output "ALL logs removal complete!"
Start-Sleep -Seconds $Timeout

Write-Output "Done!"