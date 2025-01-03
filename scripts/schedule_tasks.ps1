# PowerShell script to schedule tasks using Windows Task Scheduler

# Define the paths to the scripts
$automationScript = "C:\path\to\scripts\automation.ps1"
$backupScript = "C:\path\to\scripts\backup.ps1"
$cleanupScript = "C:\path\to\scripts\cleanup.ps1"
$logFileManagementScript = "C:\path\to\scripts\log_file_management.ps1"

# Define the triggers for the tasks
$dailyTrigger = New-ScheduledTaskTrigger -Daily -At 2am
$weeklyTrigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Monday -At 3am
$logFileManagementTrigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Sunday -At 4am

# Register the scheduled tasks
Register-ScheduledTask -Action (New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File `"$automationScript`"") -Trigger $dailyTrigger -TaskName "AutomationTask" -Description "Run automation script daily at 2am"
Register-ScheduledTask -Action (New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File `"$backupScript`"") -Trigger $weeklyTrigger -TaskName "BackupTask" -Description "Run backup script weekly on Monday at 3am"
Register-ScheduledTask -Action (New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File `"$cleanupScript`"") -Trigger $dailyTrigger -TaskName "CleanupTask" -Description "Run cleanup script daily at 2am"
Register-ScheduledTask -Action (New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File `"$logFileManagementScript`"") -Trigger $logFileManagementTrigger -TaskName "LogFileManagementTask" -Description "Run log file management script weekly on Sunday at 4am"
