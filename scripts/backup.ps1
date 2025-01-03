# PowerShell script for automated backups

# Define the files and directories to be backed up
$sourcePaths = @(
    "C:\Users\start\ShoperyOrganic\important_files",
    "C:\Users\start\ShoperyOrganic\important_directories"
)

# Define the backup destination
$backupDestination = "C:\Users\start\ShoperyOrganic\backups"

# Create the backup destination directory if it doesn't exist
if (-not (Test-Path -Path $backupDestination)) {
    New-Item -ItemType Directory -Path $backupDestination
}

# Perform the backup
foreach ($sourcePath in $sourcePaths) {
    $destinationPath = Join-Path -Path $backupDestination -ChildPath (Split-Path -Path $sourcePath -Leaf)
    Copy-Item -Path $sourcePath -Destination $destinationPath -Recurse -Force
}

Write-Output "Backup completed successfully."
