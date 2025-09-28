rem This has to be set once in the begenning of setup
set AIVEN_PASS=

rem Get session ID from santosha. this has to be set for every run.
set SESSION_ID=

ishangam_campaign.exe --campaign --caller --loop 60 --session-id --config ie_wave_lead_nurturing.config
ishangam_campaign.exe --campaign --caller --loop 90 --session-id --config ie_wave_lead_nurturing.config
pause
