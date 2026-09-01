@echo off

:: encrypt a file using base64 encoding
echo Secret password: 1234 > plain.txt
powershell -Command "[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes((Get-Content plain.txt -Raw)))" > encrypted.txt
echo Encrypted data saved in encrypted.txt
echo.

type encrypted.txt
pause 