@echo off

::Copy script in startup fold
er
copy "%~f0" "%append%\Microsoft\Windows\Start Menu\program\Startup"
echo Script added to startup!
pause