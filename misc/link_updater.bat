@echo off 
setlocal enabledelayedexpansion 
set count=0 
set tempFile=%temp%\lnkfiles.txt 
cd thcrap 
dir /b *.lnk > %tempFile% 
if %errorlevel% neq 0 (echo No .lnk files found in the current directory. 
goto :end) 
for /f "tokens=* delims=" %%A in (%tempFile%) do (set /a count+=1 
set "file!count!=%%A" 
echo !count!. %%A) 
if %count%==0 (echo No .lnk files found in the current directory. 
goto :end) 
set /p choice=Enter the number to set link as Lutris default launch: 
if not defined file%choice% (echo Invalid choice. 
goto :end) 
set chosenFile=!file%choice%! 
set "fullPath=%cd%\%chosenFile%" 
echo %chosenFile% | findstr /c:"custom" >nul
if %errorlevel% equ 0 (echo The link chosen is game configuration tool. Launching instead of setting as default.
start "" "%fullPath%"
exit)
set "newPath=%cd%\..\default.lnk"
del %tempFile% 
echo Setting as default: %fullPath% 
copy "%fullPath%" "%newPath%" 
exit
:end 
endlocal