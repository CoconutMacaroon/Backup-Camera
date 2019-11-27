[CmdletBinding()]
param (
    [Parameter()]
    $backupname = "test",
    $camerapath = "H"
)
$camerapathprocessed = -join($camerapath, ":\DCIM")
<#
.Description
Backup-Drive copies all files off of a camera and into target folder
.Example
Backup-Drive -backupname "my_photo_backup" -
#>

<# Create a directory for the photos to go into #>
Write-Verbose "Creating directory..."
New-Item -ItemType directory -Path $backupname
Write-Verbose "Directory created"

<# Recursively copy the files off the camera and into specified folder #>
Write-Verbose "Starting file copy..."
Copy-Item -Recurse -Destination $backupname -Path $camerapathprocessed | Out-Null
Write-Verbose "File copy compleate"