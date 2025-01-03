# ShoperyOrganic
## Maintenance Scripts

### Cleanup Script
To clean up temporary files, run:
```powershell
.\scripts\cleanup.ps1

## Automation with PowerShell

This project includes a PowerShell script for automation tasks. The script is located at `scripts/automation.ps1`.

### Usage

To use the PowerShell script, follow these steps:

1. Open a PowerShell terminal.
2. Navigate to the root directory of the project.
3. Run the script using the following command:
   ```powershell
   .\scripts\automation.ps1
   ```

### Tasks

The PowerShell script includes the following tasks:

- **Build the project**: Compiles the project files.
- **Run tests**: Executes the test suite.
- **Deploy the application**: Deploys the application to the specified environment.
- **Lint the project**: Lints the project files using the `npm run lint` command.

### Example Command for Linting

To lint the project, run:
```powershell
.\scripts\automation.ps1 -Task Lint
```

## Scheduling Scripts with Task Scheduler

You can schedule the PowerShell scripts to run at regular intervals using Windows Task Scheduler. This ensures your tasks are performed automatically without manual intervention.

### Using `scripts/schedule_tasks.ps1`

A new PowerShell script `scripts/schedule_tasks.ps1` has been added to create scheduled tasks for `automation.ps1`, `backup.ps1`, `cleanup.ps1`, `log_file_management.ps1`, and `software_update.ps1`.

#### Usage

To use the scheduling script, follow these steps:

1. Open a PowerShell terminal.
2. Navigate to the root directory of the project.
3. Run the script using the following command:
   ```powershell
   .\scripts\schedule_tasks.ps1
   ```

### Customizing Scheduled Tasks

You can customize the scheduled tasks by modifying the `scripts/schedule_tasks.ps1` script. Here are some customization options:

- **Adjust the paths**: Update the paths to the scripts to match your project's directory structure.
- **Change the triggers**: Modify the triggers to set different schedules for the tasks (e.g., daily, weekly).
- **Update task names and descriptions**: Change the task names and descriptions to better reflect their purpose.

### Scheduling `scripts/automation.ps1` Manually

To schedule `scripts/automation.ps1` using Task Scheduler, follow these steps:

1. Open Task Scheduler from the Start menu.
2. In the right-hand Actions pane, click "Create Basic Task".
3. Enter a name and description for the task, then click "Next".
4. Choose the trigger for the task (e.g., daily, weekly), then click "Next".
5. Set the start date and time for the task, then click "Next".
6. Choose "Start a program" as the action, then click "Next".
7. In the "Program/script" field, enter `powershell.exe`.
8. In the "Add arguments (optional)" field, enter `-File "C:\path\to\scripts\automation.ps1"`, replacing `C:\path\to\scripts\automation.ps1` with the actual path to the script.
9. Click "Next", review the settings, and click "Finish" to create the task.

## Log File Management Script

This project includes a PowerShell script for log file management. The script is located at `scripts/log_file_management.ps1`.

### Usage

To use the log file management script, follow these steps:

1. Open a PowerShell terminal.
2. Navigate to the root directory of the project.
3. Run the script using the following command:
   ```powershell
   .\scripts\log_file_management.ps1
   ```

### Tasks

The log file management script includes the following tasks:

- **Archive and compress log files**: Archives and compresses log files periodically.
- **Move archived log files**: Moves the archived log files to a designated storage location.
- **Error handling and logging**: Tracks log file management progress and issues.

## Software Update Script

This project includes a PowerShell script for automated software updates. The script is located at `scripts/software_update.ps1`.

### Usage

To use the software update script, follow these steps:

1. Open a PowerShell terminal.
2. Navigate to the root directory of the project.
3. Run the script using the following command:
   ```powershell
   .\scripts\software_update.ps1
   ```

### Tasks

The software update script includes the following tasks:

- **Check for software updates**: Checks for software updates.
- **Install software updates**: Installs software updates.
- **Error handling and logging**: Tracks update progress and issues.
