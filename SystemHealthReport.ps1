Import-Module MailKit


$now = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$file="SystemHealthReport.txt"

"System Health Report - $now" | Out-File -FilePath $file 
"==========================" | Out-File -FilePath $file -Append 
"System Information" | Out-File -FilePath $file -Append 

$cpu= Get-CimInstance -ClassName Win32_Processor|Select-Object -Property @{Name='Name';Expression = {'CPU'}} ,LoadPercentage
$cpu|out-file -FilePath $file -Append
$disk=Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DeviceID='C:'"|Select-Object -Property @{Name='Name';Expression={'Disk'}},@{Name='Free Size(GB)'; Expression={"{0:N2}" -f ($_.FreeSpace / 1GB)}}

$disk|out-file -FilePath $file -Append
