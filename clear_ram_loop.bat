@echo off
title Windows Optimizer Script
color 0A

:: === One-time: Disable Windows Updates ===
echo [*] Disabling Windows Updates...
sc stop wuauserv >nul 2>&1
sc config wuauserv start= disabled >nul 2>&1
sc stop UsoSvc >nul 2>&1
sc config UsoSvc start= disabled >nul 2>&1
sc stop bits >nul 2>&1
sc config bits start= disabled >nul 2>&1

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUOptions /t REG_DWORD /d 1 /f >nul
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" /v ToastEnabled /t REG_DWORD /d 0 /f >nul

schtasks /Change /TN "Microsoft\Windows\WindowsUpdate\Scheduled Start" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\WindowsUpdate\sih" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\WindowsUpdate\sihboot" /Disable >nul 2>&1

echo [✓] Windows Update Disabled.
echo.

:loop
echo ============================
echo [*] Starting Optimization Loop
echo ============================

:: === Show RAM usage before ===
echo [*] RAM Usage Before:
powershell -command "Get-CimInstance Win32_OperatingSystem | ForEach-Object { Write-Output ('Used: {0:N2} GB / Total: {1:N2} GB' -f (($_.TotalVisibleMemorySize - $_.FreePhysicalMemory)/1MB), ($_.TotalVisibleMemorySize/1MB)) }"

:: === Clean temp folders ===
echo [*] Cleaning temp folders...
del /q /f /s %TEMP%\* >nul 2>&1
del /q /f /s C:\Windows\Temp\* >nul 2>&1

:: === Flush DNS ===
echo [*] Flushing DNS cache...
ipconfig /flushdns >nul

:: === Clear RAM ===
echo [*] Attempting RAM Trim...
powershell -command "Get-Process | Where-Object { $_.Id -ne $PID } | ForEach-Object { try { $_.MinWorkingSet = $_.MinWorkingSet } catch {} }"

:: === Show RAM usage after ===
echo [*] RAM Usage After:
powershell -command "Get-CimInstance Win32_OperatingSystem | ForEach-Object { Write-Output ('Used: {0:N2} GB / Total: {1:N2} GB' -f (($_.TotalVisibleMemorySize - $_.FreePhysicalMemory)/1MB), ($_.TotalVisibleMemorySize/1MB)) }"

:: === Close bloat background tasks ===
echo [*] Killing background apps...
taskkill /f /im OneDrive.exe >nul 2>&1
taskkill /f /im Teams.exe >nul 2>&1
taskkill /f /im AdobeIPCBroker.exe >nul 2>&1
taskkill /f /im AdobeCollabSync.exe >nul 2>&1
taskkill /f /im ArmouryCrate.UserSessionHelper.exe
taskkill /f /im GameSDK.exe
taskkill /f /im NahimicService.exe
taskkill /f /im AuraService.exe

:: === Run RamMap to clear standby list ===
echo [*] Running RamMap64 to clear standby memory...

:: Accept the EULA silently to prevent dialog
reg add "HKCU\Software\Sysinternals\RamMap" /v EulaAccepted /t REG_DWORD /d 1 /f >nul

:: Run RamMap silently with the -Et -Es -Em -Ew flag to clear everything
"D:\WindBatchCustom\RAMMap64.exe" -Et -Es -Em -Ew

echo [✓] Cleanup Done. Sleeping for 10 seconds...
timeout /t 10 >nul
goto loop
