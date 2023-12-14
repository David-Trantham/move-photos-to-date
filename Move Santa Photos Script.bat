@echo off
::These two paths may need to be updated in the future:
set "srcpath=C:\Users\green\OneDrive\Desktop\move-photos-to-date\input"
set "destpath=C:\Users\green\OneDrive\Desktop\move-photos-to-date\output"

echo Scanning.....
dir %srcpath% /b /a-d | find /c /v ""
echo Photos have been found within the folder found at: %srcpath% 

set /P "destfolder=Please enter the date for the folder to move the photos to, or enter 'p' to view and modify paths.
if %destfolder% EQU p
    
mkdir "%destpath%\%destfolder%"
move "%srcpath%\*" "%destpath%\%destfolder%\"

pause