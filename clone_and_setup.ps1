param (
    [Parameter(Mandatory=$true)]
    [string]$repoURL
)

# Ensure any error stops the script execution
$ErrorActionPreference = "Stop"

# Extract the repository name from the provided URL using regex
if ($repoURL -match "git@github\.com:[^/]+/([^/]+)\.git") {
    $repoName = $matches[1]
}
else {
    Write-Error "Invalid repository URL format."
    exit 1
}

try {
    # Clone the repository
    Invoke-Expression "git clone $repoURL"

    # Navigate into the repository
    Set-Location -Path $repoName

    # Create and switch to the 'dev' branch
    Invoke-Expression "git checkout -b dev"

    # Create an empty text file
    $emptyFilePath = Join-Path $PWD "initial_commit.md"
    New-Item -Path $emptyFilePath -ItemType File -Force

    # Add all files and commit (assuming there might be new files/folder structure in the newly cloned repo)
    Invoke-Expression "git add ."
    Invoke-Expression 'git commit -m "initial commit"'

    # Push and set the upstream to the 'dev' branch
    Invoke-Expression "git push --set-upstream origin dev"

    # Switch to 'main' branch, merge 'dev' and push
    Invoke-Expression "git checkout main"
    Invoke-Expression "git merge dev"
    Invoke-Expression "git push"

    # Switch back to the 'dev' branch
    Invoke-Expression "git checkout dev"
}
catch {
    Write-Error $_.Exception.Message
    exit 1
}

Write-Output "Repository setup completed successfully!"