@echo off
setlocal enabledelayedexpansion
title Registry Explorer - READ ONLY (Class 12)
color 0b

:: ==========================================
:: CLASS 12 - PART 2: REGISTRY BASICS (READ ONLY)
::
:: The Registry = Windows' giant settings database.
:: Structure: HIVE\Key\SubKey -> values (name, type, data)
::
:: IMPORTANT SAFETY RULE:
:: In this class we ONLY use "reg query" (read).
:: "reg add" / "reg delete" can break Windows if misused.
:: ==========================================

:menu
cls
echo ==========================================
echo    REGISTRY EXPLORER (READ ONLY)
echo ==========================================
echo.
echo  [1] Windows version info
echo  [2] Computer name + owner
echo  [3] My autostart programs (Run key)
echo  [4] Search a value name
echo  [5] Export a key to .reg file (backup)
echo  [6] Exit
echo.
choice /c 123456 /m "Select: "

if %errorlevel%==1 call :winver
if %errorlevel%==2 call :compinfo
if %errorlevel%==3 call :autorun
if %errorlevel%==4 call :searchval
if %errorlevel%==5 call :exportkey
if %errorlevel%==6 goto end
goto menu

:: ===== 1. Windows version =====
:winverinfo
:winver
cls
echo ===== WINDOWS VERSION (Registry) =====
echo.
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v DisplayVersion
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v CurrentBuildNumber
echo.
pause
exit /b

:: ===== 2. Computer name / owner =====
:compinfo
cls
echo ===== COMPUTER IDENTITY =====
echo.
echo Computer name:
reg query "HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName" /v ComputerName
echo.
echo Registered owner:
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v RegisteredOwner 2>nul
echo.
pause
exit /b

:: ===== 3. Autostart programs (defensive check) =====
:autorun
cls
echo ===== MY AUTOSTART PROGRAMS =====
echo Malware loves these keys - check them often!
echo.
echo [HKCU Run - only my user]
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Run"
echo.
echo [HKLM Run - all users]
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" 2>nul
echo.
echo Anything you do not recognize? Investigate it!
pause
exit /b

:: ===== 4. Search a value =====
:searchval
:searchval
cls
echo ===== SEARCH REGISTRY =====
set /p key=Key to search (e.g. HKCU\Software): 
if "%key%"=="" (
    echo [!] Empty key!
    pause
    exit /b
)
set /p val=Value name to find: 
echo.
reg query "%key%" /s /f "%val%" /v 2>nul | more
echo.
echo (empty result = value not found under that key)
pause
exit /b

:: ===== 5. Export (backup) a key =====
:exportkey
:exportkey
cls
echo ===== EXPORT KEY TO FILE (safe backup) =====
set /p expkey=Key to export: 
set /p expfile=Save as (e.g. mybackup.reg): 
reg export "%expkey%" "%expfile%" /y 2>nul
if %errorlevel%==0 (
    echo [+] Exported to %expfile%
) else (
    echo [-] Export failed - check the key path!
)
echo.
echo Restore later with: reg import "%expfile%"
pause
exit /b

:end
echo Goodbye!
pause
exit
