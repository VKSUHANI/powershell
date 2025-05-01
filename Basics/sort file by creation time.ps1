# Script to Delete Files Modified Within the Last 1000 Days

# Get all files and directories from the specified path recursively, including hidden and system files
$files = Get-ChildItem -Path "C:\Users\suhan\OneDrive\Documents\Labs" -Recurse -Force 

# Define the path to the text file where filtered file paths will be stored temporarily
$text = "C:\Users\suhan\OneDrive\Documents\text.txt"

# Set the cutoff date to 1000 days ago from the current date
$cutoff = (Get-Date).AddDays(-1000)

# Output the cutoff date for reference/debugging
$cutoff

# Filter files that were modified within the last 1000 days
foreach ($file in $files) {
    if ($file.LastWriteTime -ge $cutoff) {
        # Append the file's full path to the text file
        Add-Content -Path $text -Value $file.PSPath
    }
}

# Read all lines (file paths) from the text file
$lines = Get-Content -Path $text

# Delete each file listed in the text file
foreach ($line in $lines) {
    Remove-Item -Path $line -Force
}

# Remove the temporary text file after processing
Remove-Item -Path $text