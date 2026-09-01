@echo off
if exist test.txt (
    echo File exists. Deleting...
    del test.txt
    echo Deleted!
) else (
    echo File not found.
)
pause