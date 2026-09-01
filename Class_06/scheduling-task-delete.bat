@echo off
schtasks /delete /tn "MyTask" /f
echo Task deleted!
pause