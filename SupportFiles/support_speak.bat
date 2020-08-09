echo dim speechobject > "%installfolder%\TEMP\speak.vbs"
echo set speechobject=createobject("sapi.spvoice") >> "%installfolder%\TEMP\speak.vbs"
echo dim fso >> "%installfolder%\TEMP\speak.vbs"
echo set fso = CreateObject("Scripting.FileSystemObject") >> "%installfolder%\TEMP\speak.vbs" 
echo speechobject.speak "%speak%" >> "%installfolder%\TEMP\speak.vbs"
echo fso.CreateTextFile "%installfolder%\TEMP\speak_ended.TEMP" >> "%installfolder%\TEMP\speak.vbs"

PING 1.1.1.1 -n 1 -w 200 >NUL
start "" "%installfolder%\TEMP\speak.vbs"
PING 1.1.1.1 -n 1 -w 800 >NUL
:check_voice_ended_loop
if exist "%installfolder%\TEMP\speak_ended.TEMP" goto check_voice_ended_loop_end
goto check_voice_ended_loop

:check_voice_ended_loop_end
del "%installfolder%\TEMP\speak_ended.TEMP">NUL
del "%installfolder%\TEMP\speak.vbs">NUL

