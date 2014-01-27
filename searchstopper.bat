@echo off
title Would you like to stop searching?
timeout /T 60
echo Would you like to stop searching?
echo Press any key to stop the process!
set /p searchstop=
del search.file
pause
exit
