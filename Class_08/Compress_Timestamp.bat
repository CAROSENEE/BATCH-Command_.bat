@echo off
setlocal enabledelayedexpansion

:: create unique file name using timestamp
set stamp=%date:~-10,2%%date:~-7,2%%date:~-4,4%_%time:~0,2%%time:~3,2%
set backupname=backup_%stamp%.zip

echo ===== BACKUP TOOL =====
echo.

:: check if source folder exists
set /p source=Enter folder to backup: 
if not exist "%source%" (
    echo Source folder not found!
    pause
    exit /b
)

:: create backup folder if it doesn't exist
powershell -Command "Compress-Archive -Path '%source%\*' -DestinationPath 'C:\backups\%backupname%' -Force" 2>nul

if exist "C:\backups\%backupname%" (
    echo [+] Backup created: C:\backups\%backupname%
    echo [+] Size:
    dir "C:\backups\%backupname%" | findstr "backup"
) else (
    echo [-] Backup failed. Creating backups folder...
    mkdir C:\backups
    powershell -Command "Compress-Archive -Path '%source%\*' -DestinationPath 'C:\backups\%backupname%' -Force"
    echo [+] Backup created: C:\backups\%backupname%
)
pause