@echo off
cls
echo ===== AUTO-RUN SCANNER =====
echo Checking common persistence locations...
echo.

:: Check Startup folder
echo [1] Startup Folder:
dir "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\"
echo.

:: Check scheduled tasks
echo [2] Scheduled Tasks (filtered):
schtasks /query /fo list 2>nul | findstr /i "TaskName"
echo.

:: Check Temp folder for hidden .bat
echo [3] Hidden batch files in Temp:
dir %temp%\*.bat /ah 2>nul
if %errorlevel% NEQ 0 echo     No hidden batch files found.
echo.

echo Scan complete!
pause