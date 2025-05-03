#"Automated File Organizer with PowerShell"



# Define the base path where files are located
$path="C:\Users\suhan\Downloads"

# Define the target directories for different file types
$img=Join-Path -Path $path -ChildPath "Images"
$text= join-path -Path $path -ChildPath "TextFiles"
$docs= join-path -Path $path -ChildPath "Docs"
$code= join-path -Path $path -ChildPath "Code"
$zip= join-path -Path $path -ChildPath "ZipFiles"
$video= join-path -Path $path -ChildPath "VideoFiles"
# Check if the Images directory exists, if not, create it
if (!(Test-Path -Path $img)) {
    New-Item -ItemType Directory -Path $img
}

# Check if the Docs directory exists, if not, create it
if (!(Test-Path -Path $docs)) {
    New-Item -ItemType Directory -Path $docs
}

# Check if the TextFiles directory exists, if not, create it
if (!(Test-Path -Path $text)) {
    New-Item -ItemType Directory -Path $text
}

# Check if the Code directory exists, if not, create it
if (!(Test-Path -Path $code)) {
    New-Item -ItemType Directory -Path $code
}

# Check if the ZipFiles directory exists, if not, create it
if (!(Test-Path -Path $zip)) {
    New-Item -ItemType Directory -Path $zip
}

# Check if the VideoFiles directory exists, if not, create it 
if(!(test-path -Path $video))
{
    New-Item -ItemType Directory -Path $video
}

# Get all files from the source directory recursively
$source=get-childitem -path $path -recurse

# Move image files (.jpg, .png, .jpeg) to the Images directory
$source |Where-Object {$_.Extension -match ".jpg|.png|.jpeg"}|Move-item -Destination $img -Force

# Move document files (.pdf, .docs) to the Docs direct`ory
$source |Where-Object {$_.Extension -match ".pdf|.docs"}|Move-item -Destination $docs -Force

# Move text files (.txt) to the Docs directory
$source |Where-Object {$_.Extension -match ".txt"}|Move-item -Destination $docs -Force

# Move script/code files (.ps1, .tf) to the Docs directory
$source |Where-Object {$_.Extension -match ".ps1|.tf"}|Move-item -Destination $docs -Force

$source |Where-Object {$_.Extension -match ".zip|.rar"}|Move-item -Destination $zip -Force

$source |Where-Object {$_.Extension -match ".mp4|.mkv"}|Move-item -Destination $video -Force
