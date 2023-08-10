# to be used after a push to dev assuming a linear history of pushes

# Ensure any error stops the script execution
$ErrorActionPreference = "Stop"

try {
    # Check out the main branch
    Invoke-Expression "git checkout main"
    
    # Merge changes from dev branch
    Invoke-Expression "git merge dev"

    # Push the changes
    Invoke-Expression "git push"
    
    # Check out the dev branch again
    Invoke-Expression "git checkout dev"
}
catch {
    Write-Error $_.Exception.Message
    exit 1
}

Write-Output "Quick merge completed successfully!"