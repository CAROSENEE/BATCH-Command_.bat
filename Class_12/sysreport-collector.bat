@echo off
setlocal enabledelayedexpansion
title System Report Collector (Class 12)
color 0a

:: ==========================================
:: CLASS 12 - PART 3: SYSTEM REPORT COLLECTOR
:: Combines Class 11 + 12 skills:
::   functions, timestamps, redirect,
::   PowerShell CIM, reg query, netstat, schtasks
:: Builds one full report file of your PC.
:: ==========================================

cls
echo ==========================================
echo      CAROSINE SYSTEM REPORT COLLECTOR
echo ==========================================
echo.

set stamp=%date:~-4%%date:~-10,2%%date:~-7,2%
set report=SysReport_%stamp%_%random%.txt
echo [~] Report file: %report%
echo.

echo Creating report, please wait...
echo.

echo ============================================ > "%report%"
echo  CAROSINE SYSTEM REPORT - %date% %time%  >> "%report%"
echo ============================================ >> "%report%"

call :section "BASIC IDENTITY"
echo Computer: %computername%  User: %username% >> "%report%"
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName >> "%report%" 2>nul
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v DisplayVersion >> "%report%" 2>nul

call :section "CPU"
powershell -NoProfile -Command "Get-CimInstance Win32_Processor | Select-Object Name,NumberOfCores | Format-List" >> "%report%"

call :section "RAM (GB)"
powershell -NoProfile -Command "[math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory/1GB,1)" >> "%report%" 2>nul

call :section "DISKS"
powershell -NoProfile -Command "Get-CimInstance Win32_LogicalDisk | Select-Object Caption,Size,FreeSpace | Format-List" >> "%report%"

call :section "IP CONFIGURATION"
ipconfig | findstr /i "IPv4 Gateway Adapter" >> "%report%" 2>nul

call :section "LISTENING PORTS (netstat)"
netstat -an | findstr "LISTENING" >> "%report%" 2>nul

call :section "RUNNING PROCESSES (count)"
powershell -NoProfile -Command "(Get-Process).Count" >> "%report%" 2>nul

call :section "AUTOSTART (HKCU Run)"
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" >> "%report%" 2>nul

call :section "INSTALLED PROGRAMS"
reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall /s /v DisplayName 2>nul | findstr "DisplayName" >> "%report%" 2>nul

call :section "SCHEDULED TASKS (non-Microsoft)"
schtasks /query /fo table /nh 2>nul | findstr /v "Microsoft" >> "%report%" 2>nul

echo.
echo [+] Report complete!
echo.
echo Showing summary:
type "%report%" | more
echo.
echo Saved as: %cd%\%report%
echo.
echo == HOMEWORK IDEA ==
echo Add 2 more sections: "STARTUP FOLDER" and "FIREWALL STATE"
echo (netsh advfirewall show allprofiles state)
pause
exit

:: ===== section label writer =====
:section
echo. >> "%report%"
echo ---------- %~1 ---------- >> "%report%"
exit /b
