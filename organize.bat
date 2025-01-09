@echo off
setlocal enabledelayedexpansion

rem Define the root directory
set "rootDir=%~dp0"

rem Define the folders
set "pdfFolder=%rootDir%PDF"
set "imageFolder=%rootDir%Images"
set "videoFolder=%rootDir%Videos"
set "archiveFolder=%rootDir%Archives"
set "exeFolder=%rootDir%Executables"
set "torrentFolder=%rootDir%Torrents"
set "ps1Folder=%rootDir%PowerShellScripts"
set "isoFolder=%rootDir%ISOFiles"
set "othersFolder=%rootDir%Others"
set "wordFolder=%rootDir%WordDocuments"
set "presentationFolder=%rootDir%Presentations"
set "spreadsheetFolder=%rootDir%Spreadsheets"

rem Create the main folders if they don't exist
if not exist "%pdfFolder%" mkdir "%pdfFolder%"
if not exist "%imageFolder%" mkdir "%imageFolder%"
if not exist "%videoFolder%" mkdir "%videoFolder%"
if not exist "%archiveFolder%" mkdir "%archiveFolder%"
if not exist "%exeFolder%" mkdir "%exeFolder%"
if not exist "%torrentFolder%" mkdir "%torrentFolder%"
if not exist "%ps1Folder%" mkdir "%ps1Folder%"
if not exist "%isoFolder%" mkdir "%isoFolder%"
if not exist "%othersFolder%" mkdir "%othersFolder%"
if not exist "%wordFolder%" mkdir "%wordFolder%"
if not exist "%presentationFolder%" mkdir "%presentationFolder%"
if not exist "%spreadsheetFolder%" mkdir "%spreadsheetFolder%"

rem Define the file extensions and their respective folders
for %%f in (*.pdf) do (
    move "%%f" "%pdfFolder%"
)

for %%f in (*.jpg *.jpeg *.png *.gif *.webp) do (
    set "ext=%%~xf"
    set "subFolder=!ext:~1!"
    if not exist "%imageFolder%\!subFolder!" mkdir "%imageFolder%\!subFolder!"
    move "%%f" "%imageFolder%\!subFolder!"
)

for %%f in (*.mp4 *.avi *.mkv) do (
    set "ext=%%~xf"
    set "subFolder=!ext:~1!"
    if not exist "%videoFolder%\!subFolder!" mkdir "%videoFolder%\!subFolder!"
    move "%%f" "%videoFolder%\!subFolder!"
)

for %%f in (*.zip *.rar *.7z) do (
    move "%%f" "%archiveFolder%"
)

for %%f in (*.exe *.msi) do (
    move "%%f" "%exeFolder%"
)

for %%f in (*.torrent) do (
    move "%%f" "%torrentFolder%"
)

for %%f in (*.ps1) do (
    move "%%f" "%ps1Folder%"
)

for %%f in (*.iso) do (
    move "%%f" "%isoFolder%"
)

for %%f in (*.doc *.docx *.odt) do (
    move "%%f" "%wordFolder%"
)

for %%f in (*.ppt *.pptx) do (
    move "%%f" "%presentationFolder%"
)

for %%f in (*.xls *.xlsx *.ods) do (
    move "%%f" "%spreadsheetFolder%"
)

rem Move any other file types to the Others folder, excluding batch files
for %%f in (*) do (
    if /i not "%%~xf"==".bat" (
        if not exist "%pdfFolder%\%%~nxf" if not exist "%imageFolder%\%%~nxf" if not exist "%videoFolder%\%%~nxf" if not exist "%archiveFolder%\%%~nxf" if not exist "%exeFolder%\%%~nxf" if not exist "%torrentFolder%\%%~nxf" if not exist "%ps1Folder%\%%~nxf" if not exist "%isoFolder%\%%~nxf" if not exist "%wordFolder%\%%~nxf" if not exist "%presentationFolder%\%%~nxf" if not exist "%spreadsheetFolder%\%%~nxf" move "%%f" "%othersFolder%"
    )
)

echo Categorization complete.
pause
