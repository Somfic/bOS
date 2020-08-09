set version=2

::Change installfolder to the folder where in the 'core.bat' file is located.
::Something like:
::C:\Users\Kevin\Desktop\bOS

set installfolder=C:\BOS

:: BOS - Version 2.0
:: Copyright Valeri Inc. 2016
:: Copyright ZETCH 2016

@echo off
color 0f
mode 300
title BOS %version%
cls
if not exist %installfolder%\core.bat goto ERROR_NO_INSTALLPATH
goto boot

:ERROR_NO_INSTALLPATH
cls
echo.
echo  Invalid installpath selected.
echo  You've given us the installpath: %installfolder%.
echo.
echo  By clicking on a button you will change to installpath to: %cd%.
echo.
pause
set installfolder=%cd%
goto boot

:boot

set sended=0
set boot=0
rd %installfolder%\TEMP /q /s
mkdir %installfolder%\TEMP
set %menu_option%=1

set speak=Booting into b OS, version %version%.
call %installfolder%\SupportFiles\support_speak_no_stop.bat

cls

::Start of graphical loop1

:boot_loop1_1
cls
call %installfolder%\SupportFiles\support_logo.bat
set /a boot=%boot%+%random%
PING 1.1.1.1 -n 1 -w 500 >NUL
goto boot_loop1_2

:boot_loop1_2
cls
call %installfolder%\SupportFiles\support_logo.bat
set /a boot=%boot%+%random%
PING 1.1.1.1 -n 1 -w 500 >NUL
goto boot_loop1_3

:boot_loop1_3
cls
call %installfolder%\SupportFiles\support_logo.bat
set /a boot=%boot%+%random%
PING 1.1.1.1 -n 1 -w 500 >NUL
goto boot_loop1_4

:boot_loop1_4
cls
call %installfolder%\SupportFiles\support_logo.bat
set /a boot=%boot%+%random%
PING 1.1.1.1 -n 1 -w 500 >NUL
goto boot_loop1_end

:boot_loop1_end
if not %boot% gtr 100000 goto boot_loop1_1
goto boot_loop2_1

::Start of graphical loop2

:boot_loop2_1
cls
call %installfolder%\SupportFiles\support_logo.bat
set /a boot2=%boot2%+%random%
PING 1.1.1.1 -n 1 -w 500 >NUL
goto boot_loop2_2

:boot_loop2_2
cls
call %installfolder%\SupportFiles\support_logo.bat
set /a boot2=%boot2%+%random%
PING 1.1.1.1 -n 1 -w 500 >NUL
goto boot_loop2_3

:boot_loop2_3
cls
call %installfolder%\SupportFiles\support_logo.bat
set /a boot2=%boot2%+%random%
PING 1.1.1.1 -n 1 -w 500 >NUL
goto boot_loop2_4

:boot_loop2_4
cls
call %installfolder%\SupportFiles\support_logo.bat
set /a boot2=%boot2%+%random%
PING 1.1.1.1 -n 1 -w 500 >NUL
goto boot_loop2_5

:boot_loop2_5
cls
call %installfolder%\SupportFiles\support_logo.bat
set /a boot2=%boot2%+%random%
PING 1.1.1.1 -n 1 -w 500 >NUL
goto boot_loop2_6

:boot_loop2_6
cls
call %installfolder%\SupportFiles\support_logo.bat
set /a boot2=%boot2%+%random%
PING 1.1.1.1 -n 1 -w 500 >NUL
goto boot_loop2_end

:boot_loop2_end
if not %boot2% gtr 150000 goto boot_loop2_1
cls

goto menu_startup

:menu_startup
cls
call %installfolder%\SupportFiles\support_logo_normal.bat
PING 1.1.1.1 -n 1 -w 500 >NUL
set speak=Welcome to B OS. Please enter your account information.
call %installfolder%\SupportFiles\support_speak.bat
echo.
set /p username_input=Username: 
if not exist %installfolder%\users\%username_input% goto register
goto login

:register
set speak=New user detected. Welcome to B OS, %username_input%. Please choose a pin code to protect your account.
call %installfolder%\SupportFiles\support_speak.bat
:register_after_error
cls
call %installfolder%\SupportFiles\support_logo_nocolor.bat
echo.
echo Username: %username_input%
echo.
echo Pincode: . . . .
choice /c 9876543210 /n
if %errorlevel%==10 set a=0
if %errorlevel%==9 set a=1
if %errorlevel%==8 set a=2
if %errorlevel%==7 set a=3
if %errorlevel%==6 set a=4
if %errorlevel%==5 set a=5
if %errorlevel%==4 set a=6
if %errorlevel%==3 set a=7
if %errorlevel%==2 set a=6
if %errorlevel%==1 set a=9

cls
call %installfolder%\SupportFiles\support_logo_nocolor.bat
echo.
echo Username: %username_input%
echo.
echo Pincode: * . . .
choice /c 9876543210 /n
if %errorlevel%==10 set b=0
if %errorlevel%==9 set b=1
if %errorlevel%==8 set b=2
if %errorlevel%==7 set b=3
if %errorlevel%==6 set b=4
if %errorlevel%==5 set b=5
if %errorlevel%==4 set b=6
if %errorlevel%==3 set b=7
if %errorlevel%==2 set b=8
if %errorlevel%==1 set b=9

cls
call %installfolder%\SupportFiles\support_logo_nocolor.bat
echo.
echo Username: %username_input%
echo.
echo Pincode: * * . .
choice /c 9876543210 /n
if %errorlevel%==10 set c=0
if %errorlevel%==9 set c=1
if %errorlevel%==8 set c=2
if %errorlevel%==7 set c=3
if %errorlevel%==6 set c=4
if %errorlevel%==5 set c=5
if %errorlevel%==4 set c=6
if %errorlevel%==3 set c=7
if %errorlevel%==2 set c=8
if %errorlevel%==1 set c=9

cls
call %installfolder%\SupportFiles\support_logo_nocolor.bat
echo.
echo Username: %username_input%
echo.
echo Pincode: * * * .
choice /c 9876543210 /n
if %errorlevel%==10 set d=0
if %errorlevel%==9 set d=1
if %errorlevel%==8 set d=2
if %errorlevel%==7 set d=3
if %errorlevel%==6 set d=4
if %errorlevel%==5 set d=5
if %errorlevel%==4 set d=6
if %errorlevel%==3 set d=7
if %errorlevel%==2 set d=8
if %errorlevel%==1 set d=9
cls
call %installfolder%\SupportFiles\support_logo_nocolor.bat
echo.
echo Username: %username_input%
echo.
echo Pincode: * * * *
echo.
set password_input=%a%%b%%c%%d%

PING 1.1.1.1 -n 1 -w 500 >NUL

cls
call %installfolder%\SupportFiles\support_logo_nocolor.bat
echo.
echo Username: %username_input%
echo.
echo Pincode: * * * *
echo Confirm pincode: . . . .
choice /c 9876543210 /n
if %errorlevel%==10 set e=0
if %errorlevel%==9 set e=1
if %errorlevel%==8 set e=2
if %errorlevel%==7 set e=3
if %errorlevel%==6 set e=4
if %errorlevel%==5 set e=5
if %errorlevel%==4 set e=6
if %errorlevel%==3 set e=7
if %errorlevel%==2 set e=6
if %errorlevel%==1 set e=9

cls
call %installfolder%\SupportFiles\support_logo_nocolor.bat
echo.
echo Username: %username_input%
echo.
echo Pincode: * * * *
echo Confirm pincode: * . . .
choice /c 9876543210 /n
if %errorlevel%==10 set f=0
if %errorlevel%==9 set f=1
if %errorlevel%==8 set f=2
if %errorlevel%==7 set f=3
if %errorlevel%==6 set f=4
if %errorlevel%==5 set f=5
if %errorlevel%==4 set f=6
if %errorlevel%==3 set f=7
if %errorlevel%==2 set f=8
if %errorlevel%==1 set f=9

cls
call %installfolder%\SupportFiles\support_logo_nocolor.bat
echo.
echo Username: %username_input%
echo.
echo Pincode: * * * *
echo Confirm pincode: * * . .
choice /c 9876543210 /n
if %errorlevel%==10 set g=0
if %errorlevel%==9 set g=1
if %errorlevel%==8 set g=2
if %errorlevel%==7 set g=3
if %errorlevel%==6 set g=4
if %errorlevel%==5 set g=5
if %errorlevel%==4 set g=6
if %errorlevel%==3 set g=7
if %errorlevel%==2 set g=8
if %errorlevel%==1 set g=9

cls
call %installfolder%\SupportFiles\support_logo_nocolor.bat
echo.
echo Username: %username_input%
echo.
echo Pincode: * * * *
echo Confirm pincode: * * * .
choice /c 9876543210 /n
if %errorlevel%==10 set h=0
if %errorlevel%==9 set h=1
if %errorlevel%==8 set h=2
if %errorlevel%==7 set h=3
if %errorlevel%==6 set h=4
if %errorlevel%==5 set h=5
if %errorlevel%==4 set h=6
if %errorlevel%==3 set h=7
if %errorlevel%==2 set h=8
if %errorlevel%==1 set h=9
cls
call %installfolder%\SupportFiles\support_logo_nocolor.bat
echo.
echo Username: %username_input%
echo.
echo Pincode: * * * *
echo Confirm pincode: * * * *
echo.
set password_input_confirm=%e%%f%%g%%h%

if not %password_input%==%password_input_confirm% goto error_password_error1

mkdir %installfolder%\users\%username_input%
cls
call %installfolder%\SupportFiles\support_logo_nocolor.bat
echo %password_input% > %installfolder%\users\%username_input%\passcode.data
if %sended%==1 goto menu
set speak=Your user account has been created, %username_input%.
call %installfolder%\SupportFiles\support_speak.bat
echo. > %installfolder%\users\%username_input%\background.txt
echo  !! Change your background in settings !! >> %installfolder%\users\%username_input%\background.txt
goto menu

:error_password_error1
cls
call %installfolder%\SupportFiles\support_logo_nocolor.bat
set speak=Sorry. But it looks like you did not enter the same pass code the second time, please try again.
call %installfolder%\SupportFiles\support_speak.bat
goto register_after_error

:login
set speak=Welcome back, %username_input%.
call %installfolder%\SupportFiles\support_speak.bat
:login_after_error
cls
call %installfolder%\SupportFiles\support_logo_nocolor.bat
echo.
echo Username: %username_input%
echo.
echo Pincode: . . . .
choice /c 9876543210 /n
if %errorlevel%==10 set a=0
if %errorlevel%==9 set a=1
if %errorlevel%==8 set a=2
if %errorlevel%==7 set a=3
if %errorlevel%==6 set a=4
if %errorlevel%==5 set a=5
if %errorlevel%==4 set a=6
if %errorlevel%==3 set a=7
if %errorlevel%==2 set a=6
if %errorlevel%==1 set a=9

cls
call %installfolder%\SupportFiles\support_logo_nocolor.bat
echo.
echo Username: %username_input%
echo.
echo Pincode: * . . .
choice /c 9876543210 /n
if %errorlevel%==10 set b=0
if %errorlevel%==9 set b=1
if %errorlevel%==8 set b=2
if %errorlevel%==7 set b=3
if %errorlevel%==6 set b=4
if %errorlevel%==5 set b=5
if %errorlevel%==4 set b=6
if %errorlevel%==3 set b=7
if %errorlevel%==2 set b=8
if %errorlevel%==1 set b=9

cls
call %installfolder%\SupportFiles\support_logo_nocolor.bat
echo.
echo Username: %username_input%
echo.
echo Pincode: * * . .
choice /c 9876543210 /n
if %errorlevel%==10 set c=0
if %errorlevel%==9 set c=1
if %errorlevel%==8 set c=2
if %errorlevel%==7 set c=3
if %errorlevel%==6 set c=4
if %errorlevel%==5 set c=5
if %errorlevel%==4 set c=6
if %errorlevel%==3 set c=7
if %errorlevel%==2 set c=8
if %errorlevel%==1 set c=9

cls
call %installfolder%\SupportFiles\support_logo_nocolor.bat
echo.
echo Username: %username_input%
echo.
echo Pincode: * * * .
choice /c 9876543210 /n
if %errorlevel%==10 set d=0
if %errorlevel%==9 set d=1
if %errorlevel%==8 set d=2
if %errorlevel%==7 set d=3
if %errorlevel%==6 set d=4
if %errorlevel%==5 set d=5
if %errorlevel%==4 set d=6
if %errorlevel%==3 set d=7
if %errorlevel%==2 set d=8
if %errorlevel%==1 set d=9
cls
echo.
echo Username: %username_input%
echo.
echo Pincode: * * * *
echo.
set password_input=%a%%b%%c%%d%

for /f "Delims=" %%a in (%installfolder%\users\%username_input%\passcode.data) do (
set password_correct=%%a
)

if %password_input%==%password_correct% goto menu
cls
call %installfolder%\SupportFiles\support_logo_nocolor.bat
set speak=Sorry. But it looks like you did not enter the correct pass code, please try again.
call %installfolder%\SupportFiles\support_speak.bat
goto login_after_error

:menu
for /f "Delims=" %%a in (%installfolder%\users\%username_input%\color.data) do (
set newcolor=%%a
)
color %newcolor%
cls
PING 1.1.1.1 -n 1 -w 500 >NUL
set menu_option=1
goto menu_list

:menu_list 
call %installfolder%\SupportFiles\support_menu.bat
cls
echo.
echo  BOS - %version% 
echo  %time:~0,5% - %date:~0,8%
echo.
type %installfolder%\users\%username_input%\Background.txt
echo.
echo.
echo  Select an option:
echo.
echo    %m1% Settings
echo    %m2% Programs
echo    %m3% Shutdown
echo.
echo  Use the 'Q' and 'A' keys to select an option.
echo  Press 'P' to enter an option.
echo.
choice /c qarp /n /t 5 /d r
if %errorlevel%==4 goto menu_select
if %errorlevel%==3 goto menu_list
if %errorlevel%==2 set /a menu_option=%menu_option%+1
if %errorlevel%==1 set /a menu_option=%menu_option%-1
goto menu_list

:menu_select
if %menu_option%==1 goto Options
if %menu_option%==2 goto Programs
if %menu_option%==3 goto Shutdown
goto menu_list

:options
cls
PING 1.1.1.1 -n 1 -w 500 >NUL
set menu_option=1
:options_list
call %installfolder%\SupportFiles\support_options_menu.bat
cls
echo.
echo  BOS - %version% 
echo  %time:~0,5% - %date:~0,8%
echo.
type %installfolder%\users\%username_input%\Background.txt
echo.
echo.
echo  Select an option:
echo.
echo    %m1% Create a new account
echo    %m2% Delete my account
echo    %m3% Change my pincode
echo    %m4% Change background image
echo    %m5% Color settings
echo    %m6% Go back to main menu
echo.
echo  Use the 'Q' and 'A' keys to select an option.
echo  Press 'P' to enter an option.
echo.
choice /c qarp /n /t 5 /d r
if %errorlevel%==4 goto options_select
if %errorlevel%==3 goto options_list
if %errorlevel%==2 set /a menu_option=%menu_option%+1
if %errorlevel%==1 set /a menu_option=%menu_option%-1
goto options_list

:options_select
set sended=1
if %menu_option%==1 goto menu_startup
if %menu_option%==2 goto account_delete
if %menu_option%==3 goto account_newpincode
if %menu_option%==4 goto background
if %menu_option%==5 goto color
if %menu_option%==6 goto menu
echo error
pause

:account_delete
cls
echo.
echo Username: %username_input%
echo.
echo Pincode: . . . .
choice /c 9876543210 /n
if %errorlevel%==10 set a=0
if %errorlevel%==9 set a=1
if %errorlevel%==8 set a=2
if %errorlevel%==7 set a=3
if %errorlevel%==6 set a=4
if %errorlevel%==5 set a=5
if %errorlevel%==4 set a=6
if %errorlevel%==3 set a=7
if %errorlevel%==2 set a=6
if %errorlevel%==1 set a=9

cls
echo.
echo Username: %username_input%
echo.
echo Pincode: * . . .
choice /c 9876543210 /n
if %errorlevel%==10 set b=0
if %errorlevel%==9 set b=1
if %errorlevel%==8 set b=2
if %errorlevel%==7 set b=3
if %errorlevel%==6 set b=4
if %errorlevel%==5 set b=5
if %errorlevel%==4 set b=6
if %errorlevel%==3 set b=7
if %errorlevel%==2 set b=8
if %errorlevel%==1 set b=9

cls
echo.
echo Username: %username_input%
echo.
echo Pincode: * * . .
choice /c 9876543210 /n
if %errorlevel%==10 set c=0
if %errorlevel%==9 set c=1
if %errorlevel%==8 set c=2
if %errorlevel%==7 set c=3
if %errorlevel%==6 set c=4
if %errorlevel%==5 set c=5
if %errorlevel%==4 set c=6
if %errorlevel%==3 set c=7
if %errorlevel%==2 set c=8
if %errorlevel%==1 set c=9

cls
echo.
echo Username: %username_input%
echo.
echo Pincode: * * * .
choice /c 9876543210 /n
if %errorlevel%==10 set d=0
if %errorlevel%==9 set d=1
if %errorlevel%==8 set d=2
if %errorlevel%==7 set d=3
if %errorlevel%==6 set d=4
if %errorlevel%==5 set d=5
if %errorlevel%==4 set d=6
if %errorlevel%==3 set d=7
if %errorlevel%==2 set d=8
if %errorlevel%==1 set d=9
cls
echo.
echo Username: %username_input%
echo.
echo Pincode: * * * *
echo.
set password_input=%a%%b%%c%%d%

for /f "Delims=" %%a in (%installfolder%\users\%username_input%\passcode.data) do (
set password_correct=%%a
)

if %password_input%==%password_correct% goto account_delete_yes
cls
call %installfolder%\SupportFiles\support_logo.bat
set speak=Sorry. But it looks like you did not enter the correct pass code, please try again.
call %installfolder%\SupportFiles\support_speak.bat
goto account_delete

:account_delete_yes
set menu_option=1
goto account_delete_yes2

:account_delete_yes2
cls
echo.
echo  Are you sure you want to delete the account of %username_input%?
echo.
call %installfolder%\SupportFiles\support_delete_account_menu.bat
echo  Select an option:
echo.
echo    %m1% Yes
echo    %m2% No
echo.
echo  Use the 'Q' and 'A' keys to select an option.
echo  Press 'P' to enter an option.
echo.
choice /c qarp /n /t 2 /d r
if %errorlevel%==4 goto delete_account_select
if %errorlevel%==3 goto account_delete_yes2
if %errorlevel%==2 set /a menu_option=%menu_option%+1
if %errorlevel%==1 set /a menu_option=%menu_option%-1
goto account_delete_yes2

:delete_account_select
if not %menu_option%==1 goto options
cls
rd %installfolder%\users\%username_input% /q /s
set speak=Deleting the account, %username_input%. Account is deleted.
call %installfolder%\SupportFiles\support_speak.bat
goto menu_startup

:account_newpincode
cls
echo.
echo Username: %username_input%
echo.
echo Pincode: . . . .
choice /c 9876543210 /n
if %errorlevel%==10 set a=0
if %errorlevel%==9 set a=1
if %errorlevel%==8 set a=2
if %errorlevel%==7 set a=3
if %errorlevel%==6 set a=4
if %errorlevel%==5 set a=5
if %errorlevel%==4 set a=6
if %errorlevel%==3 set a=7
if %errorlevel%==2 set a=6
if %errorlevel%==1 set a=9

cls
echo.
echo Username: %username_input%
echo.
echo Pincode: * . . .
choice /c 9876543210 /n
if %errorlevel%==10 set b=0
if %errorlevel%==9 set b=1
if %errorlevel%==8 set b=2
if %errorlevel%==7 set b=3
if %errorlevel%==6 set b=4
if %errorlevel%==5 set b=5
if %errorlevel%==4 set b=6
if %errorlevel%==3 set b=7
if %errorlevel%==2 set b=8
if %errorlevel%==1 set b=9

cls
echo.
echo Username: %username_input%
echo.
echo Pincode: * * . .
choice /c 9876543210 /n
if %errorlevel%==10 set c=0
if %errorlevel%==9 set c=1
if %errorlevel%==8 set c=2
if %errorlevel%==7 set c=3
if %errorlevel%==6 set c=4
if %errorlevel%==5 set c=5
if %errorlevel%==4 set c=6
if %errorlevel%==3 set c=7
if %errorlevel%==2 set c=8
if %errorlevel%==1 set c=9

cls
echo.
echo Username: %username_input%
echo.
echo Pincode: * * * .
choice /c 9876543210 /n
if %errorlevel%==10 set d=0
if %errorlevel%==9 set d=1
if %errorlevel%==8 set d=2
if %errorlevel%==7 set d=3
if %errorlevel%==6 set d=4
if %errorlevel%==5 set d=5
if %errorlevel%==4 set d=6
if %errorlevel%==3 set d=7
if %errorlevel%==2 set d=8
if %errorlevel%==1 set d=9
cls
echo.
echo Username: %username_input%
echo.
echo Pincode: * * * *
echo.
set password_input=%a%%b%%c%%d%

for /f "Delims=" %%a in (%installfolder%\users\%username_input%\passcode.data) do (
set password_correct=%%a
)
if %password_input%==%password_correct% goto account_newpincode_yes
cls
call %installfolder%\SupportFiles\support_logo.bat
set speak=Sorry. But it looks like you did not enter the correct pass code, please try again.
call %installfolder%\SupportFiles\support_speak.bat
goto account_newpincode

:account_newpincode_yes
cls
echo.
echo Username: %username_input%
echo.
echo New pincode: . . . .
choice /c 9876543210 /n
if %errorlevel%==10 set a=0
if %errorlevel%==9 set a=1
if %errorlevel%==8 set a=2
if %errorlevel%==7 set a=3
if %errorlevel%==6 set a=4
if %errorlevel%==5 set a=5
if %errorlevel%==4 set a=6
if %errorlevel%==3 set a=7
if %errorlevel%==2 set a=6
if %errorlevel%==1 set a=9

cls
echo.
echo Username: %username_input%
echo.
echo New pincode: * . . .
choice /c 9876543210 /n
if %errorlevel%==10 set b=0
if %errorlevel%==9 set b=1
if %errorlevel%==8 set b=2
if %errorlevel%==7 set b=3
if %errorlevel%==6 set b=4
if %errorlevel%==5 set b=5
if %errorlevel%==4 set b=6
if %errorlevel%==3 set b=7
if %errorlevel%==2 set b=8
if %errorlevel%==1 set b=9

cls
echo.
echo Username: %username_input%
echo.
echo New pincode: * * . .
choice /c 9876543210 /n
if %errorlevel%==10 set c=0
if %errorlevel%==9 set c=1
if %errorlevel%==8 set c=2
if %errorlevel%==7 set c=3
if %errorlevel%==6 set c=4
if %errorlevel%==5 set c=5
if %errorlevel%==4 set c=6
if %errorlevel%==3 set c=7
if %errorlevel%==2 set c=8
if %errorlevel%==1 set c=9

cls
echo.
echo Username: %username_input%
echo.
echo New pincode: * * * .
choice /c 9876543210 /n
if %errorlevel%==10 set d=0
if %errorlevel%==9 set d=1
if %errorlevel%==8 set d=2
if %errorlevel%==7 set d=3
if %errorlevel%==6 set d=4
if %errorlevel%==5 set d=5
if %errorlevel%==4 set d=6
if %errorlevel%==3 set d=7
if %errorlevel%==2 set d=8
if %errorlevel%==1 set d=9
cls
echo.
echo Username: %username_input%
echo.
echo New pincode: * * * *
echo.
set password_input=%a%%b%%c%%d%

PING 1.1.1.1 -n 1 -w 500 >NUL

cls
echo.
echo Username: %username_input%
echo.
echo New pincode: * * * *
echo Confirm New pincode: . . . .
choice /c 9876543210 /n
if %errorlevel%==10 set e=0
if %errorlevel%==9 set e=1
if %errorlevel%==8 set e=2
if %errorlevel%==7 set e=3
if %errorlevel%==6 set e=4
if %errorlevel%==5 set e=5
if %errorlevel%==4 set e=6
if %errorlevel%==3 set e=7
if %errorlevel%==2 set e=6
if %errorlevel%==1 set e=9

cls
echo.
echo Username: %username_input%
echo.
echo New pincode: * * * *
echo Confirm New pincode: * . . .
choice /c 9876543210 /n
if %errorlevel%==10 set f=0
if %errorlevel%==9 set f=1
if %errorlevel%==8 set f=2
if %errorlevel%==7 set f=3
if %errorlevel%==6 set f=4
if %errorlevel%==5 set f=5
if %errorlevel%==4 set f=6
if %errorlevel%==3 set f=7
if %errorlevel%==2 set f=8
if %errorlevel%==1 set f=9

cls
echo.
echo Username: %username_input%
echo.
echo New pincode: * * * *
echo Confirm New pincode: * * . .
choice /c 9876543210 /n
if %errorlevel%==10 set g=0
if %errorlevel%==9 set g=1
if %errorlevel%==8 set g=2
if %errorlevel%==7 set g=3
if %errorlevel%==6 set g=4
if %errorlevel%==5 set g=5
if %errorlevel%==4 set g=6
if %errorlevel%==3 set g=7
if %errorlevel%==2 set g=8
if %errorlevel%==1 set g=9

cls
echo.
echo Username: %username_input%
echo.
echo New pincode: * * * *
echo Confirm New pincode: * * * .
choice /c 9876543210 /n
if %errorlevel%==10 set h=0
if %errorlevel%==9 set h=1
if %errorlevel%==8 set h=2
if %errorlevel%==7 set h=3
if %errorlevel%==6 set h=4
if %errorlevel%==5 set h=5
if %errorlevel%==4 set h=6
if %errorlevel%==3 set h=7
if %errorlevel%==2 set h=8
if %errorlevel%==1 set h=9
cls
echo.
echo Username: %username_input%
echo.
echo New pincode: * * * *
echo Confirm New pincode: * * * *
echo.
set password_input_confirm=%e%%f%%g%%h%

if not %password_input%==%password_input_confirm% goto error_password_error2

echo %password_input% > %installfolder%\users\%username_input%\passcode.data
set speak=Your pin code has been changed, %username_input%.
call %installfolder%\SupportFiles\support_speak.bat
goto options

:error_password_error2
call %installfolder%\SupportFiles\support_logo.bat
set speak=Sorry. But it looks like you did not enter the same pass code the second time, please try again.
call %installfolder%\SupportFiles\support_speak.bat
goto account_newpincode_yes

:shutdown
cls
call %installfolder%\SupportFiles\support_logo_nocolor.bat
set cd=%installfolder%
set speak=Shutting down B OS version %version%.
call %installfolder%\SupportFiles\support_speak.bat
tree /f >NUL
echo.
echo.
set speak=I hope to see you soon %username_input%.
call %installfolder%\SupportFiles\support_speak.bat
echo.
echo  Bye.
PING 1.1.1.1 -n 1 -w 100 >NUL
exit

:Programs
cls
echo.
echo W.I.P
pause
goto menu

:background
cls
set speak=Change your background in the text editor. When you are done, close the editor. Do not forget to save your changes.
call %installfolder%\SupportFiles\support_speak_no_stop.bat
notepad "%installfolder%\users\%username_input%\Background.txt"
goto menu

:color
color 0f
cls
echo.
echo  Color codes:
echo.
chgcolor 0a
echo  [A] - Green
chgcolor 0b
echo  [B] - Light blue
chgcolor 0c
echo  [C] - Red
chgcolor 0d
echo  [D] - Pink
chgcolor 0e
echo  [E] - Yellow
chgcolor 0f
echo  [F] - White
chgcolor 01
echo  [1] - Dark blue
chgcolor 02
echo  [2] - Dark green
chgcolor 03
echo  [3] - Turquoise
chgcolor 04
echo  [4] - Dark red
chgcolor 05
echo  [5] - Purple
chgcolor 06
echo  [6] - Dark yellow
chgcolor 07
echo  [7] - Light grey
chgcolor 08
echo  [8] - Grey
chgcolor 09
echo  [9] - Blue
chgcolor 0f
echo.
echo Color code A7 would be Light gray on Green.
echo.
set /p colorcode=New color code: 
echo %colorcode% > %installfolder%\users\%username_input%\color.DATA
color %colorcode%
goto menu