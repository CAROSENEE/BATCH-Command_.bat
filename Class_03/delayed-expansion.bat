@echo off
setlocal enabledelayedexpansion

set /p num=Enetr a number:

for /l %%i in (1,1,10) do (
    set /a result=!num! * %%i
    echo !num! x %%i = !result!
)
pause