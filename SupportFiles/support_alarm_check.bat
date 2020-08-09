for /f "Delims=" %%a in (%installfolder%\users\%username_input%\Alarm\Alarm1.data) do (
set alarm_time_wanted=%%a
)

set alarm_time_now=%time:~0,5%
if %alarm_time_wanted%==%alarm_time_now% goto yes

goto go

:yes
 
cls
echo.
echo  Press 'x' to stop the alarm.
choice /c xr /n /t 1 /d r
if %errorlevel%==1 goto del
if %errorlevel%==2 goto yes
if not exist %installfolder%\users\%username_input%\Alarm\Alarm1.data goto go
goto yes
:del
del %installfolder%\users\%username_input%\Alarm\Alarm1.data 
goto go

:go

