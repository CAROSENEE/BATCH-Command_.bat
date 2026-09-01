@echo off

:: decryption
powershell -Command "[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String((Get-Content encrypted.txt -Raw)))"
pause 
 