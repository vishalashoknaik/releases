@echo off
set GIT_EXE=%CD%\..\PortableGit\bin\git.exe
%GIT_EXE% pull origin ishangam_calling

@echo off
setlocal

set ISHANGAM_CALLING_TOP=set

ishangam_calling_execute.bat
pause