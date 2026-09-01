b@echo off
setlocal enabledelayedexpansion

:menu
cls
echo ===== LOGGER SYSTEM =====
echo 1. Write to log
echo 2. View log
echo 3. Clear log
echo 4. Exit
set /p opt=Choice: 

if "%opt%"=="1" goto writelog
if "%opt%"=="2" goto viewlog
if "%opt%"=="3" goto clearlog
if "%opt%"=="4" goto end
goto menu

:writelog
set /p msg=Enter log message: 
echo [%date% %time%] %msg% >> log.txt
echo Logged successfully!
pause
goto menu

:viewlog
cls
echo ===== LOG CONTENTS =====
if exist log.txt (
    type log.txt
) else (
    echo No log file found.
)
pause
goto menu

:clearlog
del log.txt 2>nul
echo Log cleared!
pause
goto menu

:end
echo Goodbye!
pause