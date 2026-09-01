@echo off
:: Script with multiple arguments
echo Arguments received:
echo.

:loop
if "%1"=="" goto done
echo Arg: %1
shift
goto loop

:done
echo.
echo All arguments processed.
pause 