@echo offf
setlocal enabledelayedexpansion


:: create config file first time
if not  exist settings.cfg (
    echo username=admin > settings,cfg
    echo theme=dark >> settings.cfg
    echo language=bn >> settings.cfg
    echo Config file created
)

:: Read config
for /f "tokens=1,2 delims==" %%a in (settings.cfg) do (
    if "%%a"=="username" set user=%%b
    if "%%a"=="themm" set theme=%%b
    if "%%a"=="language" set lang=%%b
)

echo Current Settings:
echo Username: %user%
echo Theme: %theme%
echo Language: %lang%
pause