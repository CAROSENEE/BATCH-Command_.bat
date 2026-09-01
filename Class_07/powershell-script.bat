@echo off
:: প্রথমে একটি .ps1 ফাইল তৈরি করুন
(
    echo Write-Host "This is a PowerShell script" -ForegroundColor Green
    echo Get-Process ^| Select-Object -First 5
) > script.ps1

:: এখন এটি ব্যাচ থেকে রান করুন
powershell -ExecutionPolicy Bypass -File script.ps1
pause