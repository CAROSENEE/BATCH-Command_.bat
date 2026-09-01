@echo off
:menu
cls
echo ===== QUICK MENU =====
echo [1] Show IP
echo [2] Show date
echo [3] Exit
echo.
choice /c 123 /m "Select: "

if %errorlevel%==1 goto showip
if %errorlevel%==2 goto showdate
if %errorlevel%==3 goto end

:showip
ipconfig | findstr /i "IPv4"
pause
goto menu

:showdate
echo %date%
pause
goto menu

:end
echo Goodbye!
pause