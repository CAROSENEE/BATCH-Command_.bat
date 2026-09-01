@echo off
echo Hello > original.txt
copy original.txt copy.txt
echo Copied!
move copy.txt moved.txt
echo Moved!
pause