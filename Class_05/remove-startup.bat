@echo off
set startup=%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\
if exist "%startup%myscript.bat" (
    del "%startup%myscript.bat"
    echo Removed from startup!
) else (
    echo Not found in startup.
)
pause