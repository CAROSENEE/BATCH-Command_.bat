@echo off
setlocal enabledelayedexpansion
title Array Task Manager
color 0a

:: ==========================================
:: ARRAY SIMULATION - TASK MANAGER
:: Batch has no real arrays - we simulate them
:: using variable name patterns: task[0], task[1]...
:: ==========================================

set count=0

:menu
cls
echo ===== TASK MANAGER (Array Demo) =====
echo.
echo  1. Add task
echo  2. Show tasks
echo  3. Complete task (delete)
echo  4. Exit
echo.
choice /c 1234 /m "Select: "

if %errorlevel%==1 goto addtask
if %errorlevel%==2 goto showtasks
if %errorlevel%==3 goto deltask
if %errorlevel%==4 goto end

:addtask
set /p task=Enter task: 
if "%task%"=="" (
    echo [!] Task cannot be empty!
    pause
    goto menu
)
set task[!count!]=%task%
set /a count+=1
echo [+] Task added!
pause
goto menu

:showtasks
cls
echo ===== YOUR TASKS =====
if %count%==0 (
    echo  (none)
) else (
    for /l %%i in (0,1,%count%) do (
        if not "!task[%%i]!"=="" echo  [%%i] !task[%%i]!
    )
)
echo.
echo Total: %count% task(s)
pause
goto menu

:deltask
if %count%==0 (
    echo No tasks to complete!
    pause
    goto menu
)
set /p id=Enter task number to complete: 
set task[%id%]=
echo [-] Task completed (removed)!
pause
goto menu

:end
echo Goodbye!
pause
exit
