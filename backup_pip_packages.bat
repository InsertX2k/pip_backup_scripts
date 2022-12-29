@echo off
rem initializing variable
set saveTextFilePath=
cls
title Python 3.x pip packages backup script
echo =================================
echo    pip Packages backup script
echo =================================
echo WARNING: PYTHON INSTALLATION MUST BE SPECIFIED ON SYSTEM PATH FOR THIS SCRIPT TO WORK PROPERLY.
echo.
echo Enter the output file name.
rem Prompt for user to enter the path of the output directory.
set /p saveTextFilePath=FILENAME=
echo.
echo Saving a list of all installed pip packages to %saveTextFilePath%
echo.
python -m pip freeze > %saveTextFilePath%
echo [DONE] Wrote the list in %saveTextFilePath%.
echo Press any key to close this window.
pause >nul
exit /b 0
