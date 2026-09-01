@echo off
setlocal enabledelayedexpansion
title Carosine Security Toolkit v1.0
color 0a 

:: ==========================================
:: CAROSINE SECURITY TOOLKIT
:: All features are free to use. No warranty provided.
:: ==========================================

:: startup message
mshta "javascript:var sh=new ActiveXObject('WScript.Shell');sh.Popup('Welcome to Carosine Security Toolkit v1.0!',3,'Carosine Toolkit',64);close()"

:menu
cls
echo ============================================
echo      CAROSINE SECURITY TOOLKIT v1.0
echo ============================================
echo.
echo  [1] System Information
echo  [2] Network Scanner
echo  [3] File Operations
echo  [4] Logger System
echo  [5] Backup Tool
echo  [6] Startup Scanner
echo  [7] Exit
echo.
set /p choice=Select an option: 

if "%choice%"=="1" goto sysinfo
if "%choice%"=="2" goto network
if "%choice%"=="3" goto files
if "%choice%"=="4" goto logger
if "%choice%"=="5" goto backup
if "%choice%"=="6" goto startup_scan
if "%choice%"=="7" goto exit_tool
goto menu

:: ========== 1. SYSTEM INFO ==========
:sysinfo
cls
echo ===== SYSTEM INFORMATION =====
echo.
echo Computer Name: %computername%
echo Username: %username%
echo Date: %date%
echo Time: %time%
echo.
systeminfo | findstr /i "OS Name OS Version System Type Total Physical"
echo.
pause
goto menu

:: ========== 2. NETWORK SCANNER ==========
:network
cls
echo ===== NETWORK SCANNER =====
echo.
echo  [1] Ping a host
echo  [2] Active connections
echo  [3] Open ports
echo  [4] My IP
echo.
set /p netopt=Select: 

if "%netopt%"=="1" (
    set /p host=Enter IP/Domain: 
    ping -n 4 %host%
) else if "%netopt%"=="2" (
    netstat -n | find "ESTABLISHED"
) else if "%netopt%"=="3" (
    netstat -an | find "LISTENING"
) else if "%netopt%"=="4" (
    ipconfig | findstr /i "IPv4"
) else (
    echo Invalid Option!
)
pause
goto menu

:: ========== 3. FILE OPERATIONS ==========
:files
cls
echo ===== FILE OPERATIONS =====
echo.
echo  [1] Create note
echo  [2] View note
echo  [3] List files
echo  [4] Delete file
echo.
set /p fileopt=Select: 

if "%fileopt%"=="1" (
    set /p note=Enter note content: 
    echo [%date% %time%] %note% >> mynotes.txt
    echo Note saved!
) else if "%fileopt%"=="2" (
    if exist mynotes.txt (
        type mynotes.txt
    ) else (
        echo No notes yet.
    )
) else if "%fileopt%"=="3" (
    dir /b
) else if "%fileopt%"=="4" (
    set /p delfile=Enter filename to delete: 
    if exist "%delfile%" (
        del "%delfile%"
        echo Deleted!
    ) else (
        echo File not found.
    )
) else (
    echo Invalid option!
)
pause
goto menu

:: ========== 4. LOGGER SYSTEM ==========
:logger
cls
echo ===== LOGGER SYSTEM =====
echo.
echo  [1] Write log
echo  [2] View log
echo  [3] Clear log
echo.
set /p logopt=Select: 

if "%logopt%"=="1" (
    set /p msg=Enter log message: 
    echo [%date% %time%] %msg% >> system_log.txt
    echo Logged!
) else if "%logopt%"=="2" (
    if exist system_log.txt (
        type system_log.txt
    ) else (
        echo No logs yet.
    )
) else if "%logopt%"=="3" (
    del system_log.txt 2>nul
    echo Log cleared!
) else (
    echo Invalid option!
)
pause
goto menu

:: ========== 5. BACKUP TOOL ==========
:backup
cls
echo ===== BACKUP TOOL =====
echo.
set /p bsrc=Enter folder path to backup: 
if not exist "%bsrc%" (
    echo Folder not found!
    pause
    goto menu
)

set stamp=%date:~-10,2%%date:~-7,2%%date:~-4,4%
mkdir C:\backups 2>nul
powershell -Command "Compress-Archive -Path '%bsrc%\*' -DestinationPath 'C:\backups\backup_%stamp%.zip' -Force" 2>nul

if exist "C:\backups\backup_%stamp%.zip" (
    echo [+] Backup saved to C:\backups\backup_%stamp%.zip
) else (
    echo [-] Backup failed!
)
pause
goto menu

:: ========== 6. STARTUP SCANNER ==========
:startup_scan
cls
echo ===== STARTUP SCANNER =====
echo.
echo Checking Startup folder for suspicious files...
echo.
dir "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\" /b 2>nul
if %errorlevel% NEQ 0 (
    echo No files in Startup folder.
) else (
    echo.
    echo [!] Review any unknown files above!
)
echo.
echo Checking scheduled tasks...
schtasks /query /fo table 2>nul | findstr /v "Microsoft" | findstr /v "TaskName"
pause
goto menu

:: ========== 7. EXIT ==========
:exit_tool
mshta "javascript:var sh=new ActiveXObject('WScript.Shell');sh.Popup('Thank you for using Carosine Security Toolkit!',3,'Goodbye',64);close()"
echo Exiting...
timeout /t 2 >nul
exit