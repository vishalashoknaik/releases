@echo on
setlocal

REM ------------------------------
REM Configuration
REM ------------------------------
set REPO_URL=https://github.com/vishalashoknaik/wa_broadcaster.git
set BRANCH=master
set GIT_PORTABLE=PortableGit-2.51.0-64-bit.7z.exe
set GIT_DIR=PortableGit
set CLONE_DIR=wa_broadcaster
set SEVENZIP=7za.exe
set SEVENDLL=7za.dll
set TOOL_REPO=vishalashoknaik/releases
set PYTHON_SPAMURAI_SETUP=setup_python_spamurai.bat


REM Download python setup batch
curl -L -o %PYTHON_SPAMURAI_SETUP% https://raw.githubusercontent.com/%TOOL_REPO%/downloads/%PYTHON_SPAMURAI_SETUP%


REM ------------------------------
REM Download 7-Zip standalone files
REM ------------------------------
if not exist %SEVENZIP% goto DOWNLOAD_7ZA
goto SKIP_7ZA

:DOWNLOAD_7ZA
echo Downloading %SEVENZIP%...
curl -L -o %SEVENZIP% https://raw.githubusercontent.com/%TOOL_REPO%/downloads/%SEVENZIP%

:SKIP_7ZA
if not exist %SEVENDLL% goto DOWNLOAD_7ZA_DLL
goto SKIP_7ZA_DLL

:DOWNLOAD_7ZA_DLL
echo Downloading %SEVENDLL%...
curl -L -o %SEVENDLL% https://raw.githubusercontent.com/%TOOL_REPO%/downloads/%SEVENDLL%

:SKIP_7ZA_DLL

REM ------------------------------
REM Download & extract PortableGit
REM ------------------------------
if not exist %GIT_DIR% goto DOWNLOAD_GIT
goto SKIP_GIT

:DOWNLOAD_GIT
echo Downloading Git Portable...
curl -L -o %GIT_PORTABLE% https://raw.githubusercontent.com/%TOOL_REPO%/downloads/%GIT_PORTABLE%

echo Extracting Git Portable...
%SEVENZIP% x %GIT_PORTABLE% -o%GIT_DIR% -y

REM Detect actual extracted folder
for /d %%D in (%GIT_DIR%*) do set GIT_DIR=%%D

:SKIP_GIT

REM ------------------------------
REM Set Git executable
REM ------------------------------
set GIT_EXE=%CD%\%GIT_DIR%\bin\git.exe
set REPO_PATH=%CD%\%CLONE_DIR%

REM ------------------------------
REM Clone or update repo using jumps
REM ------------------------------
if exist "%CLONE_DIR%\.git" goto PULL_REPO
goto CLONE_REPO

:CLONE_REPO
echo Cloning repository...
"%GIT_EXE%" clone -b %BRANCH% %REPO_URL% "%REPO_PATH%"
goto AFTER_GIT

:PULL_REPO
echo Repository exists. Pulling latest changes...
rem cd "%REPO_PATH%"
echo Please delete the existing repository. Remember to copy any local files before that
goto END
:AFTER_GIT
echo Done!
:END
pause
