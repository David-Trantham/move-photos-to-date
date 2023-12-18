@echo off
echo Scanning.....
dir %srcpath% /b /a-d | find /c /v ""
echo Photos have been found within the source folder.

:main
set /P "destfolder=Please enter the date for the folder to move the photos to, or enter 'p' to view and modify paths.

:path_menu

::Maybe use a "Choice" to determine wether or not we are modifying the paths?
Choice /C BSD /T 10 /M "Press ""p"" to view or modify paths, or press any other key to continue..."
IF %ERRORLEVEL% EQU 1 goto path_menu



mkdir "%destpath%\%destfolder%"
move "%srcpath%\*" "%destpath%\%destfolder%\"

pause