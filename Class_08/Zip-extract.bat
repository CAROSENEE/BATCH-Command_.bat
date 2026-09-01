@echo off
powershell -Command "Expand-Archive -Path C:\temp\backup.zip -DestinationPath C:\temp\extracted -Force"
echo Files extracted!
pause