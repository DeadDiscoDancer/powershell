$Timeout = 10
$Ziparch_eq = Get-ChildItem -Path "D:\check4trick_vtbcam\Server\binEQ\logs\" -Filter "*.zip" -Recurse -File -exclude errors.latest.log


ForEach ($i in $Ziparch_eq) {
	Move-Item -LiteralPath $i.fullname -Destination "D:\check4trick_vtbcam\Server\binEQ\logs\Archive\"
}
Write-Output "EQ move completed!"
Write-Output "EQ archivation completed!"
Start-Sleep -Seconds $Timeout
