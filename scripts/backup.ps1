# PowerShell script for automated backups

# Define the files and directories to be backed up
$sourcePaths = @(
    "C:\Users\start\ShoperyOrganic\important_files",
    "C:\Users\start\ShoperyOrganic\important_directories"
)

# Define the backup destination
$backupDestination = "D:\SecureBackups"

# Create the backup destination directory if it doesn't exist
if (-not (Test-Path -Path $backupDestination)) {
    New-Item -ItemType Directory -Path $backupDestination
}

# Perform the backup with error handling and logging
try {
    foreach ($sourcePath in $sourcePaths) {
        $destinationPath = Join-Path -Path $backupDestination -ChildPath (Split-Path -Path $sourcePath -Leaf)
        Copy-Item -Path $sourcePath -Destination $destinationPath -Recurse -Force
    }
    Write-Output "Backup completed successfully."
    Add-Content -Path "$backupDestination\backup.log" -Value "$(Get-Date) - Backup completed successfully."
} catch {
    Write-Output "Backup failed: $_"
    Add-Content -Path "$backupDestination\backup.log" -Value "$(Get-Date) - Backup failed: $_"
}
