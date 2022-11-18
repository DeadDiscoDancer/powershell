$LastWrite = (get-date).AddDays(-1)
$Timeout = 5
$Ziparch_cur = Get-ChildItem -Path "D:\check4trick\Server\binCUR\server_logs" -Filter "*.zip" -Recurse -File
$Ziparch_eq = Get-ChildItem -Path "D:\check4trick\Server\binEQ\server_logs" -Filter "*.zip" -Recurse -File 
$Ziparch_fo = Get-ChildItem -Path "D:\check4trick\Server\binFO\server_logs" -Filter "*.zip" -Recurse -File
$Ziparch_aml = Get-ChildItem -Path "D:\check4trick\Server\binAML\server_logs" -Filter "*.zip" -Recurse -File
$Ziparch_all = Get-ChildItem -Path "D:\check4trick\Server\binALL\server_logs" -Filter "*.zip" -Recurse -File

ForEach ($i in $Ziparch_cur) {
	Move-Item -LiteralPath $i.fullname -Destination "D:\check4trick\Server\binCUR\server_logs\Archive\"
}
Write-Output "CUR move completed!"
Write-Output "CUR archivation completed!"
Start-Sleep -Seconds $Timeout

ForEach ($i in $Ziparch_eq) {
	Move-Item -LiteralPath $i.fullname -Destination "D:\check4trick\Server\binEQ\server_logs\Archive\"
}
Write-Output "EQ move completed!"
Write-Output "EQ archivation completed!"
Start-Sleep -Seconds $Timeout

ForEach ($i in $Ziparch_fo) {
	Move-Item -LiteralPath $i.fullname -Destination "D:\check4trick\Server\binFO\server_logs\Archive\"
}
Write-Output "FO move completed!"
Write-Output "FO archivation completed!"
Start-Sleep -Seconds $Timeout

ForEach ($i in $Ziparch_aml) {
	Move-Item -LiteralPath $i.fullname -Destination "D:\check4trick\Server\binAML\server_logs\Archive\"
}
Write-Output "AML move completed!"
Write-Output "AML archivation completed!"
Start-Sleep -Seconds $Timeout

ForEach ($i in $Ziparch_all) {
	Move-Item -LiteralPath $i.fullname -Destination "D:\check4trick\Server\binALL\server_logs\Archive\"
}
Write-Output "ALL move completed!"
Write-Output "ALL archivation completed!"
Start-Sleep -Seconds $Timeout