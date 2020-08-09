echo dim speechobject > "%installfolder%\TEMP\speak.vbs"
echo set speechobject=createobject("sapi.spvoice") >> "%installfolder%\TEMP\speak.vbs"
echo dim fso >> "%installfolder%\TEMP\speak.vbs"
echo set fso = CreateObject("Scripting.FileSystemObject") >> "%installfolder%\TEMP\speak.vbs" 
echo speechobject.speak "%speak%" >> "%installfolder%\TEMP\speak.vbs"

PING 1.1.1.1 -n 1 -w 150 >NUL
start "" "%installfolder%\TEMP\speak.vbs"
PING 1.1.1.1 -n 1 -w 150 >NUL
del "%installfolder%\TEMP\speak.vbs">NUL

