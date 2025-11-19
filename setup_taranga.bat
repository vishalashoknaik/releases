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
set SPAMURAI_SETUP=setup_spamurai.bat
curl -L -o %SPAMURAI_SETUP% https://raw.githubusercontent.com/%TOOL_REPO%/downloads/%SPAMURAI_SETUP%

%SPAMURAI_SETUP%
