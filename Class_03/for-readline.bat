@echo off
for /f %%i in (list.txt) do (
    echo Line: %%i
)
pause