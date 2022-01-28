$mypasswd = ConvertTo-SecureString "WkHib466" -AsPlainText -Force
$mycreds = New-Object System.Management.Automation.PSCredential ("borisov_pavel", $mypasswd)
Send-MailMessage -From 'borisov_pavel@forecsys.ru' -To 'borisov_pavel@forecsys.ru' -Subject "Subj test" -Body "Body test" -SmtpServer 'mail.forecsys.ru' -Credential $mycreds