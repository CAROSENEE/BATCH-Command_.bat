@echo off
echo Backup module started in new window...
mkdir C:\backup 2>null
powershell -Command "Compress-Archive -Path '%userprofile%\Documents\*' -DestinationPath 'C:\backup\documents_backup.zip' -Force" 2>null
echo Backup complete!
pause