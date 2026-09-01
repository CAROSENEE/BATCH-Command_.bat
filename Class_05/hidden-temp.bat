@echo off
set tempfile=%temp%\sysupdate_%random%.tmp

echo System update log > %tempfile%
echo [%data% %time%] Running... >> %tempfile%

::Hide the temp file
attrib +h %tempfile%

echo 