@echo off
rem This has to be set once in the begenning of setup
set AIVEN_PASS=

rem Get session ID from santosha. this has to be set for every run.
set SESSION_ID=c2ebf3a45f327ad4523b3b38e57afecf932f8917

start ishangam_campaign.exe --campaign --caller --loop 90 --session %SESSION_ID% --config ie_wave_lead_nurturing.config
ie_wave_lead_nurturing.bat

pause
