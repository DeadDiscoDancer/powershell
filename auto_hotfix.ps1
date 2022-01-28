#Значения по умолчанию

$UpdateDir = 'C:\Distr\Test_fix'
$BackupDir = 'C:\!bkp'
$InstanceDir= 'C:\check4trick_aton\'
$Service_cur = 'Check4TrickCURAton'
$Service_eq = 'Check4TrickEQAton'
$Service_fo = 'Check4TrickFOAton'
$Service_aml = 'Check4TrickAMLAton'
$Service_all = 'Check4TrickALLAton'
$Service_grpc = 'GRPCAton'

#Создание экранной формы
Add-Type -assembly System.Windows.Forms
$autofix_form = New-Object System.Windows.Forms.Form
$autofix_form.Text ='Autofix Utility v1.0. Автоустановка hotfix Check4Trick'
$autofix_form.Width = 800
$autofix_form.Height = 600
$autofix_form.AutoSize = $true
$autofix_form.StartPosition = "CenterScreen"

#Выбор директории инстанса
$InstChoice_Label = New-Object System.Windows.Forms.Label
$InstChoice_Label.Text = "Выберите директорию Check4Trick:"
$InstChoice_Label.Location = New-Object System.Drawing.Point(10,10)
$InstChoice_Label.AutoSize = $true
$autofix_form.Controls.Add($InstChoice_Label)

$InstChoice_Text = New-Object System.Windows.Forms.TextBox
$InstChoice_Text.Text = $InstanceDir
$InstChoice_Text.Location = New-Object System.Drawing.Point(10,35)
$InstChoice_Text.AutoSize = $true
$InstChoice_Text.Width = 300
$autofix_form.Controls.Add($InstChoice_Text)

$InstChoice_Button = New-Object System.Windows.Forms.Button
$InstChoice_Button.Text = 'Выбрать'
$InstChoice_Button.Location = New-Object System.Drawing.Point(320,33)
$InstChoice_Button.add_click = ($dialog)
$autofix_form.Controls.Add($InstChoice_Button)

#Выбор директории распакованного хотфикса
$InstChoice_Label = New-Object System.Windows.Forms.Label
$InstChoice_Label.Text = "Выберите директорию с хотфиксом:"
$InstChoice_Label.Location = New-Object System.Drawing.Point(10,70)
$InstChoice_Label.AutoSize = $true
$autofix_form.Controls.Add($InstChoice_Label)

$InstChoice_Text = New-Object System.Windows.Forms.TextBox
$InstChoice_Text.Text = $UpdateDir
$InstChoice_Text.Location = New-Object System.Drawing.Point(10,95)
$InstChoice_Text.AutoSize = $true
$InstChoice_Text.Width = 300
$autofix_form.Controls.Add($InstChoice_Text)

$InstChoice_Button = New-Object System.Windows.Forms.Button
$InstChoice_Button.Text = 'Выбрать'
$InstChoice_Button.Location = New-Object System.Drawing.Point(320,93)
$InstChoice_Button.add_click = ($dialog)
$autofix_form.Controls.Add($InstChoice_Button)

#Выбор директории бэкапа
$InstChoice_Label = New-Object System.Windows.Forms.Label
$InstChoice_Label.Text = "Выберите директорию бэкапа:"
$InstChoice_Label.Location = New-Object System.Drawing.Point(10,130)
$InstChoice_Label.AutoSize = $true
$autofix_form.Controls.Add($InstChoice_Label)

$InstChoice_Text = New-Object System.Windows.Forms.TextBox
$InstChoice_Text.Text = $BackupDir
$InstChoice_Text.Location = New-Object System.Drawing.Point(10,155)
$InstChoice_Text.AutoSize = $true
$InstChoice_Text.Width = 300
$autofix_form.Controls.Add($InstChoice_Text)

$InstChoice_Button = New-Object System.Windows.Forms.Button
$InstChoice_Button.Text = 'Выбрать'
$InstChoice_Button.Location = New-Object System.Drawing.Point(320,153)
$InstChoice_Button.add_click = ($dialog)
$autofix_form.Controls.Add($InstChoice_Button)

#Выбор патча
$PatchSelect = New-Object System.Windows.Forms.ComboBox
$PatchSelect.Location = New-Object System.Drawing.Point(500,35)
$PatchSelect.DataSource = @('ETL','Server','GRPC')
$autofix_form.Controls.Add($PatchSelect)

$aml_all_check = New-Object System.Windows.Forms.CheckBox

#Действия



#Запуск формы
$autofix_form.ShowDialog()

