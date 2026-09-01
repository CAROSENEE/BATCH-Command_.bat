@echo off
setlocal enabledelayedexpansion
title Carosine Modular Toolkit v2.0
color 0a

:menu
cls
echo ============================================
echo     CAROSINE MODULAR TOOLKIT v2.0
echo ============================================
echo.
echo  [1] System Information
echo  [2] Network Scanner
echo  [3] Logger System
echo  [4] Backup Tool
echo  [5] Exit
echo.
choice /c 12345 /m "Select: "

if %errorlevel%==1 call :sysinfo
if %errorlevel%==2 call :network
if %errorlevel%==3 call :logger
if %errorlevel%==4 call :backup
if %errorlevel%==5 goto end
goto menu

:: ========== FUNCTIONS ==========

:sysinfo
cls
echo ===== SYSTEM INFO =====
systeminfo | findstr /i "OS Name System Type Total Physical"
pause
exit /b

:network
cls
echo ===== NETWORK =====
ipconfig | findstr /i "IPv4"
echo.
echo Active connections:
netstat -n | find "ESTABLISHED"
pause
exit /b

:logger
cls
echo ===== LOGGER =====
set /p msg=Enter log message: 
echo [%date% %time%] %msg% >> modular_log.txt
echo Logged! Last 3 entries:
powershell -Command "Get-Content modular_log.txt | Select-Object -Last 3"
pause
exit /b

:backup
cls
echo ===== BACKUP =====
set /p folder=Enter folder path: 
if not exist "%folder%" (
    echo [-] Folder not found!
    pause
    exit /b
)
set stamp=%date:~-10,2%%date:~-7,2%%date:~-4,4%
mkdir C:\backups 2>nul
powershell -Command "Compress-Archive -Path '%folder%\*' -DestinationPath 'C:\backups\modular_%stamp%.zip' -Force" 2>nul
if %errorlevel%==0 (
    echo [+] Backup created: C:\backups\modular_%stamp%.zip
) else (
    echo [-] Backup failed!
)
pause
exit /b

:end
echo Goodbye from Carosine Modular Toolkit!
timeout /t 2 >nul
exit