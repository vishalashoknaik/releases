@echo on
setlocal

REM ------------------------------
REM Config: GitHub repo and branch
REM ------------------------------
set REPO=vishalashoknaik/releases
set BRANCH=ishangam_calling

REM ------------------------------
REM 7-Zip executable and DLL
REM ------------------------------
set EXE=7za.exe
set DLL=7za.dll

REM ------------------------------
REM Download 7-Zip standalone files
REM ------------------------------
echo Downloading %EXE% and %DLL%...
curl -L -o %EXE% https://raw.githubusercontent.com/%REPO%/download_bat/7za.exe
curl -L -o %DLL% https://raw.githubusercontent.com/%REPO%/download_bat/7za.dll

REM ------------------------------
REM Download latest branch as ZIP
REM ------------------------------
set ZIPFILE=%BRANCH%.zip
echo Downloading %BRANCH% branch as ZIP...
curl -L -o %ZIPFILE% https://github.com/%REPO%/archive/refs/heads/%BRANCH%.zip

REM ------------------------------
REM Clean old extracted folder
REM ------------------------------
if exist %BRANCH% rd /s /q %BRANCH%

REM ------------------------------
REM Extract ZIP using 7za.exe
REM ------------------------------
echo Extracting ZIP using %EXE%...
"%EXE%" x %ZIPFILE% -aoa -o%BRANCH%

 move /Y ishangam_calling\releases-ishangam_calling\ishangam_calling.bat ishangam_calling
 
REM ------------------------------
echo Done! Folder is ready: %BRANCH%
pause
