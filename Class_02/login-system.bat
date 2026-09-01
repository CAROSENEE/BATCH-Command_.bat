@echo off
color 0b
title Login System

:login
cls
echo ==========================
echo       LOGIN SYSTEM
echo ==========================
set /p user=Username:
set /p pass=Password:

if "%user%"=="admin" if "%pass%"=="1234" goto success
if "%user%"=="user2" if "%pass%"=="5678" goto success
echo Invalid credentials!
pause
goto login

:success
cls
echo ==========================
echo       WELCOME, %user%!
echo ==========================
echo 1. Show System Info
echo 2. Logout
set /p opt=Select:

if %opt%=="1" goto sysinfo
if %opt%==""2" goto login
goto success

:sysinfo
cls
echo System Information
echo ------------------
echo OS: %os%
echo Computer Name: %computername%
echo Usename: %username%
pause
goto success