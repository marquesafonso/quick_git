param (
    [Parameter(Mandatory=$true)]
    [string]$m
)
# Ensure any error stops the script execution
$ErrorActionPreference = "Stop"

try {
    # Check out the main branch
    Invoke-Expression "git status"
    
    # Merge changes from dev branch
    Invoke-Expression "git add ."

    # Push the changes
    Invoke-Expression "git commit -m '$m'"
    
    # Check out the dev branch again
    Invoke-Expression "git push"
}
catch {
    Write-Error $_.Exception.Message
    exit 1
}

Write-Output "Quick merge completed successfully!"