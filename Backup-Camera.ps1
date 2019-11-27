[CmdletBinding()]
param (
    [Parameter(Position=0,mandatory=$true)][string]$backupname = "camera-backup",
    [Parameter(Position=1,mandatory=$true)][string]$cameradrive = "H"
)
$camerapathprocessed = -join($cameradrive, ":\DCIM")

<#
.Description
Backup-Drive copies all files off of a camera and into target folder
.Example
Backup-Camera -backupname "my_photo_backup" -cameradrive "D"
#>

<# Create a directory for the photos to go into #>
Write-Verbose "Creating directory..."
New-Item -ItemType directory -Path $backupname
Write-Verbose "Directory created"

<# Recursively copy the files off the camera and into specified folder #>

Write-Verbose "Starting file copy..."
try {
    Copy-Item -Recurse -Destination $backupname -Path $camerapathprocessed | Out-Null
    Write-Verbose "File copy finished sucessfully"
}
catch {
    Write-Error -Message "File copy failed. Ensure that the camerapath is ONLY the drive letter. Also note that Backup-Drive won't overwrite files, instead throwing an error"
}
