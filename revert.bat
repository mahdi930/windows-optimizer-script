@echo off
title Revert Windows Optimizer Changes
color 0C

echo [*] Re-enabling Windows Update Services...
sc config wuauserv start= auto
sc start wuauserv
sc config UsoSvc start= demand
sc start UsoSvc
sc config bits start= delayed-auto
sc start bits

echo [*] Removing registry keys...
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /f >nul
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUOptions /f >nul
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" /v ToastEnabled /f >nul

echo [*] Re-enabling scheduled tasks...
schtasks /Change /TN "Microsoft\Windows\WindowsUpdate\Scheduled Start" /Enable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\WindowsUpdate\sih" /Enable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\WindowsUpdate\sihboot" /Enable >nul 2>&1

echo [✓] System update settings restored to default.
pause
