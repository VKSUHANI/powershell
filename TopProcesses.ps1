$logFile="C:\Users\suhan\OneDrive\Documents\logs\TopProcesses.txt"
$date=(Get-Date).Date
"Top 5 Processes by CPU -$date"|Out-File -FilePath  $logFile
"=========================================="|Out-File -FilePath  $logFile -Append
Get-Process | Sort-Object CPU -Descending | Select-Object -First 5 Name,CPU | Out-File -FilePath $logFile -Append
"=========================================="|Out-File -FilePath  $logFile -Append