@echo off
powershell -Command "
    $name = 'Carosine';
    Write-Host ('Welcome, ' + $name) -ForegroundColor Cyan;
    $date = Get-Date;
    Write-Host ('Today is: ' + $date) -ForegroundColor Yellow
"
pause