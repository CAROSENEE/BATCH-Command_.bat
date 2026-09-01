@echo off
setlocal enabledelayedexpansion

:input_loop
set /p age=Enter your age: 

:: সংখ্যা কিনা চেক করা
set /a check=!age! 2>nul
if !errorlevel! GEQ 1 (
    echo [!] Please enter a valid number!
    goto input_loop
)

if %age% GEQ 18 (
    echo You are an adult.
) else (
    echo You are a minor.
)
pause