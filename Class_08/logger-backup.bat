@echo off
:: A task that runs a batch file every hour
set script=%cd%\backup.bat

:: Create the backup script first
(
    echo @echo off
    echo echo [%%date%% %%time%%] Hourly backup running... ^>^> C:\backup_log.txt
) > "%script%"

:: Schedule it
schtasks /create /tn "HourlyBackup" /tr "%script%" /sc hourly /mo 1 /f
echo Hourly backup task created!
pause