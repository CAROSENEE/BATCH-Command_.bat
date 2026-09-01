@echo off
:: একটি টাস্ক তৈরি যা প্রতি মিনিটে notepad খুলবে
schtasks /create /tn "MyTask" /tr "notepad.exe" /sc minute /mo 1 /f
echo Task created! It will run every minute.
pause