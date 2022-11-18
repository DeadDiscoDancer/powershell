#$sourceDir = "D:\Scripts\ExportData\migrations\BaseModel"
#$targetDir_online = "D:\Customers\MTS\20210622\2_22\win\2.22.66\DBmigrations\migrations\online\online_migrations\init_files"
#$targetDir_history = "D:\Customers\MTS\20210622\2_22\win\2.22.66\DBmigrations\migrations\history\history_migrations\init_files"
#$targetDir_client = "D:\Customers\MTS\20210622\2_22\win\2.22.66\DBmigrations\migrations\client\client_migrations\init_files"
#$targetDir_metadata = "D:\Customers\MTS\20210622\2_22\win\2.22.66\DBmigrations\migrations\metadata\metadata_migrations\init_files"
$connStr = "mssql+pymssql://p.borisov:IUkEA8YwwmRp@10.77.20.33:1433"
$prefix = "Prof"
#Move-Item "$sourceDir\OnlineEQ.py" "$targetDir_online\eq\"
#Move-Item "$sourceDir\OnlineCUR.py" "$targetDir_online\cur\"
#Move-Item "$sourceDir\OnlineFO.py" "$targetDir_online\fo\"
#Move-Item "$sourceDir\HistoryEQ.py" "$targetDir_client\eq\"
#Move-Item "$sourceDir\HistoryCUR.py" "$targetDir_client\cur\"
#Move-Item "$sourceDir\HistoryFO.py" "$targetDir_client\fo\"
#Move-Item "$sourceDir\ClientEQ.py" "$targetDir_history\eq\"
#Move-Item "$sourceDir\ClientCUR.py" "$targetDir_history\cur\"
#Move-Item "$sourceDir\ClientFO.py" "$targetDir_history\fo\"
#Move-Item "$sourceDir\ClientMetadata.py" "$targetDir_metadata\"
#Write-Output "Move Complete"
cd C:\distriv\DBmigrations\DBmigrations\migrations\metadata
alembic -x market_type=eq -x dbname=$connStr/$prefix.ClientMetadata -x db_type=mssql  upgrade head
Write-Output "Metadata Complete!"
cd C:\distriv\DBmigrations\DBmigrations\migrations\client
alembic -x market_type=eq -x dbname=$connStr/$prefix.ClientEQ -x db_type=mssql upgrade head
alembic -x market_type=cur -x dbname=$connStr/$prefix.ClientCUR -x db_type=mssql  upgrade head
alembic -x market_type=fo -x dbname=$connStr/$prefix.ClientFO -x db_type=mssql  upgrade head
alembic -x market_type=eq -x dbname=$connStr/$prefix.ClientSPB -x db_type=mssql upgrade head
Write-Output "Client Complete!"
cd C:\distriv\DBmigrations\DBmigrations\migrations\online
alembic -x market_type=eq -x dbname=$connStr/$prefix.OnlineEQ -x db_type=mssql  upgrade head
alembic -x market_type=cur -x dbname=$connStr/$prefix.OnlineCUR -x db_type=mssql  upgrade head
alembic -x market_type=fo -x dbname=$connStr/$prefix.OnlineFO -x db_type=mssql  upgrade head
alembic -x market_type=eq -x dbname=$connStr/$prefix.OnlineSPB -x db_type=mssql  upgrade head
Write-Output "Online Complete!"
cd C:\distriv\DBmigrations\DBmigrations\migrations\history
alembic -x market_type=eq -x dbname=$connStr/$prefix.HistoryEQ -x db_type=mssql  upgrade head
alembic -x market_type=cur -x dbname=$connStr/$prefix.HistoryCUR -x db_type=mssql  upgrade head
alembic -x market_type=fo -x dbname=$connStr/$prefix.HistoryFO -x db_type=mssql  upgrade head
alembic -x market_type=eq -x dbname=$connStr/$prefix.HistorySPB -x db_type=mssql  upgrade head
Write-Output "History Complete!"

Write-Output "Well Done!"