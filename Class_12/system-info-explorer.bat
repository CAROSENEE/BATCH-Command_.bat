@echo off
setlocal enabledelayedexpansion
title System Info Explorer (Class 12)
color 0a

:: ==========================================
:: CLASS 12 - PART 1: SYSTEM INFO WITH POWERSHELL CIM
::
:: Old Windows used WMIC. New Windows 11 removed it,
:: so now we use PowerShell Get-CimInstance.
:: It asks Windows itself for hardware/software info.
::
:: Pattern: powershell -Command "Get-CimInstance <class>"
::   Win32_Processor       = CPU
::   Win32_OperatingSystem = OS
::   Win32_BIOS            = BIOS
::   Win32_PhysicalMemory  = RAM
::   Win32_LogicalDisk     = drives
:: ==========================================

:menu
cls
echo ==========================================
echo      SYSTEM INFO EXPLORER (CIM)
echo ==========================================
echo.
echo  [1] CPU info
echo  [2] Operating System
echo  [3] BIOS / Motherboard
echo  [4] RAM (memory chips)
echo  [5] Disks and partitions
echo  [6] Running processes (brief)
echo  [7] Installed programs list
echo  [8] Back / Exit
echo.
choice /c 12345678 /m "Select: "

if %errorlevel%==1 call :cpu
if %errorlevel%==2 call :osinfo
if %errorlevel%==3 call :biosinfo
if %errorlevel%==4 call :ram
if %errorlevel%==5 call :disk
if %errorlevel%==6 call :process
if %errorlevel%==7 call :programs
if %errorlevel%==8 exit /b
goto menu

:: ===== 1. CPU =====
:cpu
cls
echo ===== CPU =====
echo.
powershell -NoProfile -Command "Get-CimInstance Win32_Processor | Select-Object Name,NumberOfCores,MaxClockSpeed | Format-List"
pause
exit /b

:: ===== 2. OS =====
:osinfo
cls
echo ===== OPERATING SYSTEM =====
echo.
powershell -NoProfile -Command "Get-CimInstance Win32_OperatingSystem | Select-Object Caption,Version,OSArchitecture | Format-List"
echo Build number (from registry):
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v DisplayVersion 2>nul
pause
exit /b

:: ===== 3. BIOS =====
:biosinfo
cls
echo ===== BIOS / MOTHERBOARD =====
echo.
powershell -NoProfile -Command "Get-CimInstance Win32_BIOS | Select-Object Manufacturer,SerialNumber,SMBIOSBIOSVersion | Format-List"
powershell -NoProfile -Command "Get-CimInstance Win32_BaseBoard | Select-Object Manufacturer,Product | Format-List"
pause
exit /b

:: ===== 4. RAM =====
:ram
cls
echo ===== RAM =====
echo.
powershell -NoProfile -Command "Get-CimInstance Win32_PhysicalMemory | Select-Object Manufacturer,Capacity,Speed | Format-List"
echo Total RAM (GB):
powershell -NoProfile -Command "[math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory/1GB,1)"
pause
exit /b

:: ===== 5. DISKS =====
:disk
cls
echo ===== DISKS =====
echo.
echo Physical drives:
powershell -NoProfile -Command "Get-CimInstance Win32_DiskDrive | Select-Object Model,Size | Format-List"
echo Logical drives (partitions):
powershell -NoProfile -Command "Get-CimInstance Win32_LogicalDisk | Select-Object Caption,Size,FreeSpace | Format-List"
pause
exit /b

:: ===== 6. PROCESSES =====
:process
cls
echo ===== RUNNING PROCESSES =====
echo.
tasklist /fo table | more +3
echo.
echo Tip: count them all with  tasklist ^| find /c /v ""
pause
exit /b

:: ===== 7. INSTALLED PROGRAMS =====
:programs
cls
echo ===== INSTALLED PROGRAMS (from registry) =====
echo.
reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall /s /v DisplayName 2>nul | findstr "DisplayName" | findstr /v "REG_SZ  $"
echo.
echo --- PowerShell alternative ---
echo powershell -Command "Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\* | Select DisplayName, DisplayVersion"
pause
exit /b
