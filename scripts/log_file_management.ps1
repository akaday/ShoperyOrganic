# PowerShell script for log file management

# Define the log file directory and archive destination
$logFileDirectory = "C:\Users\start\ShoperyOrganic\logs"
$archiveDestination = "D:\ArchivedLogs"

# Create the archive destination directory if it doesn't exist
if (-not (Test-Path -Path $archiveDestination)) {
    New-Item -ItemType Directory -Path $archiveDestination
}

# Archive and compress log files
try {
    $logFiles = Get-ChildItem -Path $logFileDirectory -Filter *.log
    foreach ($logFile in $logFiles) {
        $archivePath = Join-Path -Path $archiveDestination -ChildPath ($logFile.Name + ".zip")
        Compress-Archive -Path $logFile.FullName -DestinationPath $archivePath
        Remove-Item -Path $logFile.FullName -Force
    }
    Write-Output "Log files archived and compressed successfully."
    Add-Content -Path "$archiveDestination\log_file_management.log" -Value "$(Get-Date) - Log files archived and compressed successfully."
} catch {
    Write-Output "Log file management failed: $_"
    Add-Content -Path "$archiveDestination\log_file_management.log" -Value "$(Get-Date) - Log file management failed: $_"
}
