@echo off
set /a num=15
if %num% GTR 10 (
    echo Number is greater than 10 and it is %num%
) else (
    echo Number is %num% or less
)
pause