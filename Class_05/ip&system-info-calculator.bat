@echo off
setlocal enabledelayedexpansion
set outfile=%temp%\sysinfo_%date:~-4,4%%date:~-10,2%%date:~-7,2%.txt

(
    echo ===== SYSTEM INFO =====
    echo Date: %date%
    echo Time: %time%
    echo Computer: %computername%
    echo User: %username%
    echo.
    echo IP Configuration:
) > %outfile%

ipconfig >> %outfile%

:: Hide it
attrib +h %outfile%

echo System info saved to hidden file: %outfile%
pause