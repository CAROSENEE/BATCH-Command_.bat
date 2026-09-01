@echo off
echo Do you want to continue?
echo [Y] Yes  [N] No
choice /c YN /m "Your choice: "\
if %errorlevel%==1 (
    echo You chose YES
) else (
    echo You chose NO
)