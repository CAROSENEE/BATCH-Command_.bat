@echo off
set /p pass=Enter password:
if %pass%==1234 (
            echo Access Granted!
        ) else (
            echo Access Denied!
        )
pause