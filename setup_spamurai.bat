@echo off
setlocal

REM ==============================
REM Configuration
REM ==============================
set REPO_URL=https://github.com/vishalashoknaik/wa_broadcaster.git
set BRANCH=master
set GIT_PORTABLE=PortableGit-2.51.0-64-bit.7z.exe
set GIT_DIR=PortableGit
set CLONE_DIR=taranga
set SEVENZIP=7za.exe
set SEVENDLL=7za.dll
set TOOL_REPO=vishalashoknaik/releases
set PYTHON_SPAMURAI_SETUP=setup_python_spamurai.bat
set PYTHON_SPAMURAI_7Z=python_311_spamurai.7z
set PYTHON_DIR=python_311_spamurai

REM ==============================
REM Download python setup batch
REM ==============================
curl -L -o %PYTHON_SPAMURAI_SETUP% https://raw.githubusercontent.com/%TOOL_REPO%/downloads/%PYTHON_SPAMURAI_SETUP%


REM ==============================
REM Fresh Python Install
REM ==============================
echo Checking Python directory...


if exist %PYTHON_SPAMURAI_7Z% (
    echo Removing old python 7z...
    del %PYTHON_SPAMURAI_7Z%
)

REM echo Downloading fresh python portable...
REM curl -L -o python_spamurai.zip https://raw.githubusercontent.com/%TOOL_REPO%/downloads/python_spamurai.zip

REM echo Extracting python portable...
REM %SEVENZIP% x python_spamurai.zip -o"%PYTHON_DIR%" -y


REM ==============================
REM 7-Zip Standalone Download
REM ==============================
if not exist %SEVENZIP% (
    echo Downloading %SEVENZIP%...
    curl -L -o %SEVENZIP% https://raw.githubusercontent.com/%TOOL_REPO%/downloads/%SEVENZIP%
)

if not exist %SEVENDLL% (
    echo Downloading %SEVENDLL%...
    curl -L -o %SEVENDLL% https://raw.githubusercontent.com/%TOOL_REPO%/downloads/%SEVENDLL%
)


REM ==============================
REM Download & Extract PortableGit
REM ==============================
if exist "%GIT_DIR%" (
    echo Cleaning up existing Git directory...
    rmdir /s /q "%GIT_DIR%"
)

echo Downloading Git Portable...
curl -L -o %GIT_PORTABLE% https://raw.githubusercontent.com/%TOOL_REPO%/downloads/%GIT_PORTABLE%

echo Extracting Git Portable...
%SEVENZIP% x %GIT_PORTABLE% -o%GIT_DIR% -y

REM Detect actual extracted folder
for /d %%D in (%GIT_DIR%*) do set GIT_DIR=%%D


REM ==============================
REM Install python
REM ==============================
echo "%PYTHON_DIR%"
if exist "%PYTHON_DIR%" (
    echo Removing existing python installation...
    rmdir /s /q "%PYTHON_DIR%"
)

set SKIP_PAUSE=1
CALL %PYTHON_SPAMURAI_SETUP%

REM ==============================
REM Set Git executable
REM ==============================
set GIT_EXE=%CD%\%GIT_DIR%\bin\git.exe
set REPO_PATH=%CD%\%CLONE_DIR%


REM ==============================
REM Clone or Reset Repository
REM ==============================
if exist "%CLONE_DIR%\.git" goto RESET_REPO
goto CLONE_REPO

:CLONE_REPO
echo Cloning repository fresh...
"%GIT_EXE%" clone -b %BRANCH% %REPO_URL% "%REPO_PATH%"
goto AFTER_GIT


:RESET_REPO
echo Repository exists. Resetting to latest commit...

cd "%REPO_PATH%"

echo Fetching latest...
"%GIT_EXE%" fetch --all

echo Hard-resetting tracked files...
"%GIT_EXE%" reset --hard origin/%BRANCH%

echo NOT deleting untracked files (as requested).

cd ..
goto AFTER_GIT


:AFTER_GIT


del %PYTHON_SPAMURAI_7Z%
del %GIT_PORTABLE%
del %SEVENZIP%
del %SEVENDLL%

echo Setup completed successfully!
pause
