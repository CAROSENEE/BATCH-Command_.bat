@echo off
setlocal enabledelayedexpansion
title Carosine Ultimate Toolkit v2.0
color 0a

:: ==========================================
:: CAROSINE ULTIMATE TOOLKIT v2.0
:: Combines everything learned in all classes:
:: menus, functions, arrays, choice, error
:: handling, PowerShell, networking, backup
:: ==========================================

:: Startup popup
mshta "javascript:var sh=new ActiveXObject('WScript.Shell');sh.Popup('Carosine Ultimate Toolkit v2.0',2,'Welcome',64);close()" 2>nul

:menu
cls
echo ===============================================
echo      CAROSINE ULTIMATE TOOLKIT v2.0
echo ===============================================
echo.
echo  [1] System Info
echo  [2] Network Scanner
echo  [3] File Manager
echo  [4] Task Manager (Array Demo)
echo  [5] Port Scanner (Local)
echo  [6] Logger System
echo  [7] Backup and Archive
echo  [8] Startup Scanner
echo  [9] Exit
echo.
choice /c 123456789 /m "Select: "

if %errorlevel%==1 call :sysinfo
if %errorlevel%==2 call :network
if %errorlevel%==3 call :filemgr
if %errorlevel%==4 call :taskmgr
if %errorlevel%==5 call :portscan
if %errorlevel%==6 call :logger
if %errorlevel%==7 call :backup
if %errorlevel%==8 call :startscan
if %errorlevel%==9 call :exitapp
goto menu

:: ===== 1. SYSTEM INFO =====
:sysinfo
cls
echo ===== SYSTEM INFO =====
echo.
echo Hostname: %computername%
echo User: %username%
echo Date: %date%   Time: %time%
echo.
systeminfo | findstr /i "OS Name OS Version System Manufacturer Total Physical"
pause
exit /b

:: ===== 2. NETWORK SCANNER =====
:network
cls
echo ===== NETWORK =====
echo.
echo IPv4 Address:
ipconfig | findstr /i "IPv4"
echo.
echo Active Connections:
netstat -n | find "ESTABLISHED"
pause
exit /b

:: ===== 3. FILE MANAGER =====
:filemgr
cls
echo ===== FILE MANAGER =====
echo [1] List files
echo [2] Create a note
echo [3] Read a note
echo.
choice /c 123 /m "Select: "
if %errorlevel%==1 (
    dir /b
    pause
)
if %errorlevel%==2 (
    set /p note=Enter note: 
    echo [%date% %time%] %note% >> notes.txt
    echo Saved!
    pause
)
if %errorlevel%==3 (
    if exist notes.txt (type notes.txt) else (echo No notes yet.)
    pause
)
exit /b

:: ===== 4. TASK MANAGER (Array) =====
:taskmgr
cls
set tcount=0

:tloop
cls
echo ===== TASK MANAGER (Array Demo) =====
echo.
if %tcount%==0 (
    echo  (no tasks)
) else (
    for /l %%i in (0,1,%tcount%) do (
        if not "!titem[%%i]!"=="" echo  [%%i] !titem[%%i]!
    )
)
echo.
echo [A] Add task   [C] Complete task   [Q] Back to menu
choice /c acq /m "Select: "

if %errorlevel%==1 (
    set /p t=Enter task: 
    set titem[!tcount!]=!t!
    set /a tcount+=1
    cls
    goto tloop
)
if %errorlevel%==2 (
    set /p id=Task # to complete: 
    set titem[!id!]=
    cls
    goto tloop
)
if %errorlevel%==3 exit /b

:: ===== 5. PORT SCANNER (LOCAL ONLY) =====
:portscan
cls
echo ===== PORT SCANNER (Localhost Only) =====
echo.
for %%p in (21 22 23 25 53 80 110 135 139 443 445 3306 3389 8080) do (
    powershell -Command "$t=New-Object System.Net.Sockets.TcpClient; $t.ConnectAsync('127.0.0.1',%%p).Wait(150); if($t.Connected){$t.Close(); exit 0}else{exit 1}" >nul 2>&1
    if !errorlevel!==0 (echo [+] Port %%p OPEN) else (echo [-] Port %%p closed)
)
echo.
echo Scan complete!
pause
exit /b

:: ===== 6. LOGGER SYSTEM =====
:logger
cls
set /p msg=Enter log message: 
if "%msg%"=="" (
    echo [!] Empty message!
    pause
    exit /b
)
echo [%date% %time%] %msg% >> ultimatelog.txt
echo Logged! Last 5 entries:
echo.
powershell -Command "Get-Content ultimatelog.txt | Select-Object -Last 5"
pause
exit /b

:: ===== 7. BACKUP =====
:backup
cls
echo ===== BACKUP =====
set /p src=Enter folder to backup: 
if not exist "%src%" (
    echo [-] Folder not found!
    pause
    exit /b
)
set stamp=%date:~-10,2%%date:~-7,2%%date:~-4,4%
mkdir C:\backups 2>nul
powershell -Command "Compress-Archive -Path '%src%\*' -DestinationPath 'C:\backups\backup_%stamp%.zip' -Force" 2>nul
if !errorlevel!==0 (
    echo [+] Success: C:\backups\backup_%stamp%.zip
) else (
    echo [-] Backup failed!
)
pause
exit /b

:: ===== 8. STARTUP SCANNER =====
:startscan
cls
echo ===== STARTUP SCANNER =====
echo.
echo Checking Startup folder...
dir "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\" /b 2>nul
if %errorlevel% NEQ 0 echo  (empty - nothing suspicious)
echo.
echo Checking scheduled tasks...
schtasks /query /fo table /nh 2>nul | findstr /v "Microsoft"
pause
exit /b

:: ===== 9. EXIT =====
:exitapp
cls
mshta "javascript:var sh=new ActiveXObject('WScript.Shell');sh.Popup('Thank you for using Carosine Ultimate Toolkit v2.0!',3,'Goodbye',64);close()" 2>nul
echo Exiting...
timeout /t 2 >nul
exit
