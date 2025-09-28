@echo off
set GIT_EXE=%CD%\..\PortableGit\bin\git.exe
%GIT_EXE% pull origin ishangam_calling
ishangam_calling_execute.bat
pause