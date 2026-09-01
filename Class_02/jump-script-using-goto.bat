@echo off
echo Starting...
goto menu

:menu
echo 1. Say Hello
echo 2. Say Goodbye
echo 3. Exit
set /p choise=Chose:

if "%Choise%"=="1" goto hello
if "%Choise%"=="2" goto goodbye
if "%Choise%"=="3" goto end
goto menu

:hello
echo Hello, Boss!
pause
goto menu

:goodbye
echo See you later!
pause
goto menu

:end
echo Exiting...
pause