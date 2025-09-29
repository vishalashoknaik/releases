@echo off

echo Executing...
call session_id.bat
call db_pass.bat

:: Check if environment variable is set
if not defined ISHANGAM_CALLING_TOP (
    echo Please run ishangam_calling.bat file...
    pause
    exit /b 1
)


:: Check if environment variable is set
if not defined AIVEN_PASS (
    echo [ERROR] AIVEN_PASS is not set!
    echo Please set it in db_pass.bat file
    pause
    exit /b 1
)

:: If set, print confirmation (masking the value)
echo AIVEN_PASS is set.


@echo off
setlocal

:: Check if environment variable is set
if not defined SESSION_ID (
    echo [ERROR] SESSION_ID is not set!
    echo Please set it in the batch file
    pause
    exit /b 1
)

:: If set, print confirmation (masking the value)
echo SESSION_ID is set.


start ie_wave_lead_nurturing.bat
ie_wave_potential_med_p1.bat
pause
