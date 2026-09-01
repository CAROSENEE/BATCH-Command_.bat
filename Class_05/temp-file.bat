@echo off

create temp file
set  tempfile=%temp%\myscript_%random%.tmp

echo temporary file: %tempfile%
echo This is temp data > %tempfile%
type %tempfile%

kaj ses e delete
del %tempfile%
echo Temp file deleted!
pause
