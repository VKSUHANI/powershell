$path="C:\Users\suhan\Downloads"
$dest = "C:\Users\suhan\Downloads\exe_files_dir\"
if (!(Test-Path -path $dest)){
    New-Item -ItemType Directory -Path $dest
} 
Get-ChildItem -Path $path -Recurse|Where-Object {$_.Extension -eq ".exe"}|move-Item -Destination $dest -Force