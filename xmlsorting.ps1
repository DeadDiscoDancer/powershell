#Start PowerShell as Administrator
Start-Process powershell -Verb runAs

#$curdate = Get-Date -UFormat "%d.%m.%Y"

#Create output log file
#new-item -path "C:\new_reports" -name "output-$curdate.txt" -type "file" -value "sorting output log for $curdate `n" -force

# Folder where Files and Folders are located
$TopFolder = "C:\new_reports"

Write-Host "Sorting reports in $TopFolder"  #| Out-File "output-$curdate.txt" 

# Getting Folders and Files
$Folders = gci $TopFolder -OutVariable Files | ? { $_.PSisContainer }

# Loop over all Files with *.xml extension
$Files | ? { $_.Extension -eq '.xml' } | % {

											# Split FileName to get report date
											$num = ($_.BaseName -split "_")[3]
											$yyyy = '20' + $num.Substring(4,2)
											$mm = $num.Substring(2,2)
											$dd = $num.Substring(0,2)
											$foldername = $yyyy + $mm + $dd

											Write-Host $foldername

											# Get FolderName by reading out foldername and compare it to number
											# $MoveTo = $Folders | ? { $_ -eq $foldername }

											Write-Host "`n" #| Out-File output-$curdate.txt
											Write-Host "Checking date directory existence..." #| Out-File "output-$curdate.txt" -Append
											New-Item -Path "C:\new_reports" -Name $foldername -ItemType "directory" #| Out-File "output-$curdate.txt" -Append
											Write-Host "Directory $MoveTo found. Moving file $_" #| Out-File "output-$curdate.txt" -Append
											Move-Item -path "C:\new_reports\$_" -Destination "C:\new_reports\$foldername" -Force #| Out-File "output-$curdate.txt" -Append
											Write-Host "Moved report $($_.Name) to directory $MoveTo" #| Out-File "output-$curdate.txt" -Append
											Write-Host "`n"
			}
Read-Host