# PowerShell script for automation tasks

# Build the project
Write-Host "Building the project..."
npm run build

# Run tests
Write-Host "Running tests..."
npm test

# Deploy the application
Write-Host "Deploying the application..."
# Add your deployment commands here
Write-Host "Deployment completed."

# Lint the project
Write-Host "Linting the project..."
npm run lint
Write-Host "Linting completed."

# System monitoring
Write-Host "Monitoring system performance..."

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
    if ($cpuUsage.CounterSamples.CookedValue -gt 80) {
        Send-EmailAlert -subject "High CPU Usage Alert" -body "CPU usage has exceeded 80%."
    }
}

# Function to monitor memory usage
function Monitor-Memory {
    $memoryUsage = Get-Counter '\Memory\% Committed Bytes In Use'
    if ($memoryUsage.CounterSamples.CookedValue -gt 80) {
        Send-EmailAlert -subject "High Memory Usage Alert" -body "Memory usage has exceeded 80%."
    }
}

# Function to monitor disk space
function Monitor-Disk {
    $diskUsage = Get-Counter '\LogicalDisk(_Total)\% Free Space'
    if ($diskUsage.CounterSamples.CookedValue -lt 20) {
        Send-EmailAlert -subject "Low Disk Space Alert" -body "Disk space has fallen below 20%."
    }
}

# Monitor system performance
Monitor-CPU
Monitor-Memory
Monitor-Disk

Write-Host "System monitoring completed."
