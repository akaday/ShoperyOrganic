$tempFiles = Get-ChildItem -Path "C:\Users\start\ShoperyOrganic\temp" -Recurse -Force
foreach ($file in $tempFiles) {
    try {
        Remove-Item -Path $file.FullName -Force
        Write-Output "Removed: $($file.FullName)"
    } catch {
        Write-Output "Failed to remove: $($file.FullName) - Error: $_"
    }
}

Write-Output "Temporary files cleaned up."

# Error handling and logging for cleanup progress and issues
try {
    $logFile = "C:\Users\start\ShoperyOrganic\cleanup.log"
    Add-Content -Path $logFile -Value "$(Get-Date) - Cleanup completed successfully."
} catch {
    Write-Output "Failed to write to log file: $_"
}
