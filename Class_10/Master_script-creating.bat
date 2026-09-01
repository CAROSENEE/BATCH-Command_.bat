@echo off
title Master Control Script
color 0a
cls

echo ===== MASTER CONTROL =====
echo This script will call other scripts.
echo.

:: Module 1 চালানো (ফিরে আসবে)
echo [1/3] Running system_info.bat...
call system_info.bat
echo.

:: Module 2 চালানো (ফিরে আসবে)
echo [2/3] Running network_check.bat...
call network_check.bat
echo.

:: Module 3 আলাদা উইন্ডোতে খোলা
echo [3/3] Opening backup tool in new window...
start backup_tool.bat

echo.
echo All modules executed. Backup runs in separate window.
pause