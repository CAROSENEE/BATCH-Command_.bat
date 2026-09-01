@echo off
setlocal enabledelayedexpansion

:: This is a CONCEPT DEMO - how keyloggers work in theory
:: Real keyloggers use low-level hooks in C++/C#

echo ===== KEYLOGGER CONCEPT DEMO =====
echo (Educational purpose only)
echo.

:: Simulated keystroke logging
set logfile=%temp%\keylog_%random%.tmp
attrib +h %logfile% 2>nul

echo [%date% %time%] Session started > %logfile%

:loop
set /p input=Enter text (or type 'exit' to stop): 
echo [%date% %time%] Input: %input% >> %logfile%

if /i "%input%"=="exit" goto showlog
goto loop

:showlog
cls
echo ===== LOGGED DATA =====
type %logfile%
echo.
echo A real keylogger captures EVERY keystroke
echo without user interaction using Windows Hooks (SetWindowsHookEx)
echo This requires compiled code (C/C++/C#), not batch files.
pause