@echo off
title Ignore Me!
echo >> taxes.file
:start
del taxes.file
timeout /t 300
goto start
