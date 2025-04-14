# Attempt to set execution policy silently (may still prompt for permission)
Try {
    Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned -Force -ErrorAction Stop
} Catch {
    Write-Host "⚠️ Could not change execution policy automatically. You may need to run:"
    Write-Host "Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned"
    Start-Sleep -Seconds 3
}

# Unblock all files in the current directory
Get-ChildItem -Recurse | Unblock-File

# Run the invisible VBS launcher
Start-Process "run_invisible.vbs"
