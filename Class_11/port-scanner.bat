@echo off
setlocal enabledelayedexpansion
color 0a
title Port Scanner (Educational - Localhost Only)

:: ==========================================
:: EDUCATIONAL PORT SCANNER
:: Scans LOCALHOST (127.0.0.1) ONLY
:: For learning how port scanning works
:: ==========================================

cls
echo ===== EDUCATIONAL PORT SCANNER =====
echo Target: 127.0.0.1 (your own PC only)
echo.

set ports=21 22 23 25 53 80 110 135 139 443 445 1433 3306 3389 8080 8443

echo Scanning common ports on localhost...
echo.

for %%p in (%ports%) do (
    powershell -Command "$t=New-Object System.Net.Sockets.TcpClient; $t.ConnectAsync('127.0.0.1',%%p).Wait(150); if($t.Connected){$t.Close(); exit 0}else{exit 1}" >nul 2>&1
    
    if !errorlevel!==0 (
        echo [+] Port %%p is OPEN
    ) else (
        echo [-] Port %%p is closed
    )
)

echo.
echo Scan complete!
echo.
echo Tip: To see all listening ports at once, run:
echo     netstat -an ^| find "LISTENING"
pause
