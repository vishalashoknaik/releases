set AIVEN_PASS=
set SESSION_ID=
ishangam_campaign.exe --campaign --caller --loop 60 --session-id --config ie_wave_lead_nurturing.config
ishangam_campaign.exe --campaign --caller --loop 90 --session-id --config ie_wave_lead_nurturing.config
pause
