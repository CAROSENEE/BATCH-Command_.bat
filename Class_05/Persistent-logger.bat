@echo off
setlocal enabledelayedexpansion

:: Hidden temp file এ লগ রাখা
set logfile=%temp%\syslog_%computername%.tmp
attrib +h %logfile% 2>nul

:log
cls
echo ===== SYSTEM LOGGER =====
echo 1. Write to hidden log
echo 2. View hidden log
echo 3. Delete hidden log
echo 4. Add to startup
echo 5. Exit
set /p opt=Choice:

if "%opt%"=="1" goto writelog
if "%opt%"=="2" goto viewlog
if "%opt%"=="3" goto dellog
if "%opt%"=="4" goto addstartup
if "%opt%"=="5" goto end
goto log

:writelog
set /p msg=Enter log message: 
echo [%date% %time%] %msg% >> %logfile%
echo Logged to hidden file!
pause
goto log

:viewlog
cls
if exist %logfile% (
    type %logfile%
) else (
    echo No log file found.
)
pause
goto log

:dellog
attrib -h %logfile%
del %logfile%
echo Hidden log deleted!
pause
goto log

:addstartup
copy "%~f0" "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\"
echo Added to startup!
pause
goto log

:end
echo Exiting...
pause