@echo off
set /p num=-Enter a number for multiplication table:

for /l %%i in (1,1,10) do (
    set /a result=%num% * %%i
    echo %num% x %%i = 
)
pause