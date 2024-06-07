@echo off
color 7
title Log Killer

echo  -==========================================-
echo  -               Log Killer                 -
echo  -   This tool is going to delete all logs! -
echo  -==========================================-
echo.
timeout 5

for /F "tokens=*" %%G in ('wevtutil.exe el') DO (
    call :clear "%%G"
)

echo.
echo Logs have been deleted.
goto :theEnd

:clear
echo [+] Deleting %1
wevtutil.exe cl %1
goto :eof

:theEnd
timeout 3
exit
