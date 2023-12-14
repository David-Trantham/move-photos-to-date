@echo off
::These two paths may need to be updated in the future:
set "srcpath=C:\Users\green\OneDrive\Desktop\move-photos-to-date\input"
set "destpath=C:\Users\green\OneDrive\Desktop\move-photos-to-date\output"

echo Scanning.....
dir %srcpath% /b /a-d | find /c /v ""
echo Photos have been found within the folder found at: %srcpath% 

::Maybe use a "Choice" to determine wether or not we are modifying the paths?
Choice /C p /T 10 /M "Press ""p"" to view or modify paths, or press any other key to continue..."
IF %ERRORLEVEL% EQU 1 goto path_menu

set /P "destfolder=Please enter the date for the folder to move the photos to, or enter 'p' to view and modify paths.

mkdir "%destpath%\%destfolder%"
move "%srcpath%\*" "%destpath%\%destfolder%\"

pause