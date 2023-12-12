@echo off
set "srcpath=C:\Users\green\OneDrive\Desktop\move-photos-to-date\input"
set "destpath=C:\Users\green\OneDrive\Desktop\move-photos-to-date\output"
set /P "destfolder=Please enter the date for the folder to move the photos to:"
mkdir "%destpath%\%destfolder%"
move "%srcpath%\*" "%destpath%\%destfolder%\"