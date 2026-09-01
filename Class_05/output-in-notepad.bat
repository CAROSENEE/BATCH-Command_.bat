@echo off
systeminfo | find "Debian Kali" > os_info.txt
notepad os_info.txt
pause