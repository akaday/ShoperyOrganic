# PowerShell script for user account management

# Function to create a new user account
function New-UserAccount {
    param (
        [string]$username,
        [string]$password,
        [string]$fullname,
        [string]$ou
    )

    $userPrincipalName = "$username@domain.com"
    $user = New-ADUser -Name $fullname -GivenName $fullname -SamAccountName $username -UserPrincipalName $userPrincipalName -Path $ou -AccountPassword (ConvertTo-SecureString $password -AsPlainText -Force) -Enabled $true
    Write-Output "User account $username created successfully."
}

# Function to modify an existing user account
function Modify-UserAccount {
    param (
        [string]$username,
        [string]$newFullname,
        [string]$newPassword
    )

    $user = Get-ADUser -Identity $username
    if ($user) {
        Set-ADUser -Identity $username -GivenName $newFullname
        if ($newPassword) {
            Set-ADAccountPassword -Identity $username -NewPassword (ConvertTo-SecureString $newPassword -AsPlainText -Force)
        }
        Write-Output "User account $username modified successfully."
    } else {
        Write-Output "User account $username not found."
    }
}

# Function to delete a user account
function Remove-UserAccount {
    param (
        [string]$username
    )

    $user = Get-ADUser -Identity $username
    if ($user) {
        Remove-ADUser -Identity $username
        Write-Output "User account $username deleted successfully."
    } else {
        Write-Output "User account $username not found."
    }
}

# Example usage
# New-UserAccount -username "jdoe" -password "P@ssw0rd" -fullname "John Doe" -ou "OU=Users,DC=domain,DC=com"
# Modify-UserAccount -username "jdoe" -newFullname "Johnathan Doe" -newPassword "N3wP@ssw0rd"
# Remove-UserAccount -username "jdoe"
