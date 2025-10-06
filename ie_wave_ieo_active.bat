call session_id.bat
call db_pass.bat
ishangam_campaign.exe --campaign --caller --loop 30 --session %SESSION_ID% --config ie_wave_ieo_active.json
pause