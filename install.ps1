$user=$env:USERNAME
Write-Output $user
$curdir=(Get-Location).Path 
Write-Output "$distrpath"
$distrpath=Get-ChildItem -Path "$curdir" -Filter "*.jar"
Write-Output "$distrpath"
$instpath="C:\Users\$user\AppData\Roaming\.minecraft\test\"

Write-Output "Installation path: $instpath. Copying mods..."

ForEach ($File in $distrpath) {
	Write-Output "Copying $File..."
	$File | Copy-Item -Destination $instpath -Force
	Start-Sleep -Seconds 1
}

Write-Output "Mods are up to date! You may delete this distribution if you wish to."


Write-Output "PRESS ENTER TO CLOSE..."
Read-Host
