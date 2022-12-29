@echo off
rem initializing variable
set restorePackagesFileName=
cls
title Restore a pip packages backup file (requirements.txt)
echo ========================
echo    Restore pip packages backup
echo ========================
echo WARNING: PYTHON INSTALLATION MUST BE ADDED TO SYSTEM PATH FOR THIS SCRIPT TO WORK.
echo.
echo Please specify the file name of the requirements.txt file or the file that contains the list of pip packages that you previously packed up.
set /p restorePackagesFileName=FILENAME=
echo.
echo Installing all packages specified in %restorePackagesFileName% ...
echo.
python -m pip install -r "%restorePackagesFileName%"
echo [DONE] Installed all packages specified in %restorePackagesFileName%.
echo.
choice /c YN /N /M "Would you like to update installed packages? [Y,N]"
if %errorlevel% == 1 (
    python -m pip install --upgrade -r "%restorePackagesFileName%"
    echo [DONE] Upgraded packages.
    echo Press any key to close this window.
    pause >nul
    exit /b 0
) else (
    echo [INFO] Will not update installed packages, user may need to update them manually later.
    echo All done, press any key to close this window.
    pause >nul
    exit /b 0
)
rem abnormal ending
exit /b 1
