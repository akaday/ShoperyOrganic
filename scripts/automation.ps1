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
