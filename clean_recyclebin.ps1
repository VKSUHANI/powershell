# This script cleans up the recycle bin by removing files that are older than 100 days.
# Use elevated privileges to run this script, as it requires access to the recycle bin.

# Set the threshold date for files to be considered old (100 days ago)
$old_date = (get-date).AddDays(-100)


# Define the path to the recycle bin
$recyclebin = "C:\`$Recycle.Bin\*"


# Retrieve files in the recycle bin that match the threshold date
$files = Get-ChildItem -path $recyclebin -Recurse -Force |Where-Object {$_.LastWriteTime -lt $old_date}


foreach ($file in $files) {
    remove-item -path $file -Force
}



