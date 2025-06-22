# Stop any running Node.js processes
taskkill /F /IM node.exe /T > $null 2>&1

# Remove directories
$itemsToRemove = @(
    ".next",
    "node_modules",
    "package-lock.json"
)

foreach ($item in $itemsToRemove) {
    if (Test-Path $item) {
        Remove-Item -Path $item -Recurse -Force -ErrorAction SilentlyContinue
        Write-Host "Removed: $item"
    } else {
        Write-Host "Not found: $item"
    }
}

Write-Host "Cleanup complete!"
