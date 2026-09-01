@echo off
echo Testing error handling...

:: একটি ভুল কমান্ড চালানো (ফাইল নেই)
copy nonexistent.txt backup.txt 2>nul

if %errorlevel%==0 (
    echo [+] Copy successful
) else (
    echo [-] Copy failed! Error code: %errorlevel%
)
pause