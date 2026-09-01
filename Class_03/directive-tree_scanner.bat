@echo off
setlocal enabledelayedexpansion

echo Scanning current directory...
for %%f in (*.*) do (
    echo File: %f
)
echo.
echo Scanning subdirectories...
for /r %%f in (*.txt) do (
    echo TXT File: %%f
) 