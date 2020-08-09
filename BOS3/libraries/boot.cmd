:: BOS 3 Supernova edition
::
:: boot.cmd

@echo off

setlocal enabledelayedexpansion
mode 100,30
set cmdwidth=100
set cmdheight=30


set file=dir.bat
if not exist "%cd%\dir.bat" goto error.02

call "%cd%\dir.bat"

set file=support_color.exe
if not exist "%libraries%\support_color.exe" goto error.02

set file=Unknown

:file.check
color 0f
echo.
set ran=%random%
echo %ran% > "%libraries%\boot_check.BOS"
set trial=0
:file.check.boot
set /a trial=%trial%+1
if %trial%==1500 goto error.03
if not exist %libraries%\boot_check.BOS goto file.check.loop
for /f "Delims=" %%a in (%libraries%\boot_check.BOS) do (
set ran_check=%%a
)
if not %ran%==%ran_check% goto file.check.boot
del "%libraries%\boot_check.BOS" 
goto finished


:error.01
cls
echo.
echo.
call "%libraries%\support_color.exe" 0c
set "Center=An error occurded" & call :CenterText Center strLen
call "%libraries%\support_color.exe" 0f
echo.
echo.
set "Center=The following file is unreachable:" & call :CenterText Center strLen
echo.
call "%libraries%\support_color.exe" c0
echo   ( \%file% )  
call "%libraries%\support_color.exe" 0f
echo.
call "%libraries%\support_color.exe" 08
set "Center=Press the 'Y' key if you want to continue booting," & call :CenterText Center strLen
set "Center=but this may have negative effects on the system." & call :CenterText Center strLen
set "Center=Process will be terminated in 10 seconds." & call :CenterText Center strLen
call "%libraries%\support_color.exe" 0f
echo.
choice /c yn /n /t 10 /d n
if %errorlevel%==2 goto terminate
if %errorlevel%==1 goto file.check
goto terminate
exit

:error.02
cls
echo.
echo.
set "Center=A critical error occurded" & call :CenterText Center strLen
echo.
echo.
set "Center=The following file is unreachable:" & call :CenterText Center strLen
echo.
echo   ( \%file% )
echo.
set "Center=Since this is critical file," & call :CenterText Center strLen
set "Center=Boot cannot be continued." & call :CenterText Center strLen
echo.
set "Center=Press a key to terminate." & call :CenterText Center strLen
echo.
pause >NUL
goto terminate

:error.03
cls
echo.
echo.
set "Center=A critcal error occurded" & call :CenterText Center strLen
echo.
echo.
set "Center=BOS cannot write to or read from files" & call :CenterText Center strLen
set "Center=located in the installation folder." & call :CenterText Center strLen
echo.
set "Center=Boot cannot be continued." & call :CenterText Center strLen
echo.
set "Center=Press a key to terminate." & call :CenterText Center strLen
echo.
pause >NUL
goto terminate

:terminate
cls
echo.
echo.
set "Center=Terminating boot sequense." & call :CenterText Center strLen
echo.
set "Center=Terminated." & call :CenterText Center strLen
PING 1.1.1.1 -n 1 -w 2000 >NUL
exit

:CenterText
  if not "!%1:~%len%!"=="" set /A len+=1 & goto :CenterText
(endlocal & set %2=%len%)
goto CenterTextDisplay
:AddSpace
set "spaces=%spaces% "
goto :eof
:CenterTextDisplay
set /a "indent=(cmdwidth - strLen)/2" 
set "spaces= "
for /l %%a in (1,1,%indent%) do call :AddSpace
echo %spaces%%Center%
set "len=0"
goto :eof


:finished
echo.
echo  END OF FILE
echo.
pause >NUL
