@echo on
setlocal

REM ------------------------------
REM Configuration
REM ------------------------------
set PYTHON_ZIP=python_311_spamurai.7z
set PYTHON_DIR=python_311_spamurai
set SEVENZIP=7za.exe
set SEVENDLL=7za.dll
set TOOL_REPO=vishalashoknaik/releases

REM ------------------------------
REM Download 7-Zip standalone files (if not present)
REM ------------------------------
if not exist "%SEVENZIP%" (
    echo Downloading %SEVENZIP%...
    curl -L -o "%SEVENZIP%" https://raw.githubusercontent.com/%TOOL_REPO%/downloads/%SEVENZIP%
)
if not exist "%SEVENDLL%" (
    echo Downloading %SEVENDLL%...
    curl -L -o "%SEVENDLL%" https://raw.githubusercontent.com/%TOOL_REPO%/downloads/%SEVENDLL%
)

REM ------------------------------
REM Download Python portable zip
REM ------------------------------
if not exist "%PYTHON_ZIP%" (
    echo Downloading %PYTHON_ZIP%...
    curl -L -o "%PYTHON_ZIP%" https://raw.githubusercontent.com/%TOOL_REPO%/downloads/%PYTHON_ZIP%
)

if not exist "%PYTHON_ZIP%" (
    echo ERROR: Failed to download %PYTHON_ZIP%.
    pause
    exit /b 1
)

REM ------------------------------
REM Extract Python
REM ------------------------------
if not exist "%PYTHON_DIR%" (
    echo Extracting Python to %PYTHON_DIR%...
    "%SEVENZIP%" x "%PYTHON_ZIP%" -o"%PYTHON_DIR%" -y
) else (
    echo Python already extracted in "%PYTHON_DIR%".
)

REM ------------------------------
REM Configure environment
REM ------------------------------
set PYTHON_EXE=%CD%\%PYTHON_DIR%\python.exe

if not exist "%PYTHON_EXE%" (
    echo ERROR: Python executable not found after extraction.
    pause
    exit /b 1
)

echo Adding Python to PATH temporarily...
set PATH=%CD%\%PYTHON_DIR%;%PATH%

echo.
echo ----------------------------------
echo Python Portable Setup Complete!
echo Python Path: %PYTHON_EXE%
echo Python Version:
"%PYTHON_EXE%" --version
echo ----------------------------------
echo.

pause
endlocal
