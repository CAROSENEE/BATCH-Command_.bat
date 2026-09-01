@echo off
setlocal enabledelayedexpansion
title Function Demo

:: function call kora
call :welcome
call :showdate
call :add 10 20

echo Back to main script.
pause
exit /b

:: ========== FUNCTIONS ==========

:welcome
echo ==============================
echo   WELCOME TO FUNCTION DEMO
echo ==============================
exit /b

:showdate
echo Today: %date%
exit /b

:add
set /a result=%1 + %2
echo Sum of %1 + %2 = %result%
exit /b