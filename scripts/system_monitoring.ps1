# PowerShell script for system monitoring

# Define the system performance metrics to be monitored
$cpuThreshold = 80
$memoryThreshold = 80
$diskThreshold = 80

# Function to send email alerts
function Send-EmailAlert {
    param (
        [string]$subject,
        [string]$body
    )

    $smtpServer = "smtp.example.com"
    $smtpFrom = "monitoring@example.com"
    $smtpTo = "admin@example.com"
    $message = New-Object system.net.mail.mailmessage
    $message.from = $smtpFrom
    $message.To.add($smtpTo)
    $message.Subject = $subject
    $message.Body = $body
    $smtp = New-Object Net.Mail.SmtpClient($smtpServer)
    $smtp.Send($message)
}

# Function to monitor CPU usage
function Monitor-CPU {
    $cpuUsage = Get-Counter '\Processor(_Total)\% Processor Time'
    if ($cpuUsage.CounterSamples.CookedValue -gt $cpuThreshold) {
        Send-EmailAlert -subject "High CPU Usage Alert" -body "CPU usage has exceeded $cpuThreshold%."
    }
}

# Function to monitor memory usage
function Monitor-Memory {
    $memoryUsage = Get-Counter '\Memory\% Committed Bytes In Use'
    if ($memoryUsage.CounterSamples.CookedValue -gt $memoryThreshold) {
        Send-EmailAlert -subject "High Memory Usage Alert" -body "Memory usage has exceeded $memoryThreshold%."
    }
}

# Function to monitor disk space
function Monitor-Disk {
    $diskUsage = Get-Counter '\LogicalDisk(_Total)\% Free Space'
    if ($diskUsage.CounterSamples.CookedValue -lt $diskThreshold) {
        Send-EmailAlert -subject "Low Disk Space Alert" -body "Disk space has fallen below $diskThreshold%."
    }
}

# Monitor system performance
Monitor-CPU
Monitor-Memory
Monitor-Disk

Write-Output "System monitoring completed."
