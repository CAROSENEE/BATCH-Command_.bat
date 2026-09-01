@echo off
echo Active network connection:
for /f "tokens=5" %%a in ('netstat -n ^| find "ESTABLISHED"') do (
    echo Connected to: %%a
)
pause