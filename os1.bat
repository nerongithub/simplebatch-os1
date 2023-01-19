@Echo Off
SetLocal EnableExtensions DisableDelayedExpansion
For /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)

GoTo load

:load
Call :Logo
Echo IIIIIIIII
Echo ---------------------------------------------------------------------------
Echo Booting up simplebatch 1.0 ....
Timeout /t 1 /nobreak > nul
Cls
Call :Logo
Echo IIIIIIIIIIIIIIIIIIIIIIIIIII
Echo ---------------------------------------------------------------------------
Echo Booting up simplebatch 1.0 ....
Timeout /t 1 /nobreak > nul
Call :Logo
Echo IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
Echo ---------------------------------------------------------------------------
Echo Booting up simplebatch 1.0 ....
Timeout /t 1 /nobreak > nul 
Call :Logo
Echo IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
Echo ---------------------------------------------------------------------------
Echo Booting up simplebatch 1.0 ....
Timeout /t 1 /nobreak > nul
Call :Logo
Echo IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
Echo ---------------------------------------------------------------------------
Echo Booting up simplebatch 1.0 ....
Timeout /t 1 /nobreak > nul
GoTo :Boot

:ColorText
Echo Off
<nul set /p ".=%DEL%" > "%~2"
Findstr /v /a:%1 /R "^$" "%~2" nul
Del "%~2" > nul 2>&1
Goto :EOF

:Logo
ClS
Echo                                       :!!.           Time: %TIME%
Echo                                     :!7^^.           Date: %DATE%
Echo                         ..         :!7^^
Echo                        Y??Y   :?YJJ?:
Echo                        J77? ^^JGGPPG!
Echo                           ^^YGBGGG5!
Echo                         ~YGGGGGY~
Echo                      .!5GGGBGJ^^
Echo                      ?BBGBGJ^^
Echo                      .~Y5?:
Echo ---------------------------------------------------------------------------
GoTo :EOF

:Boot
Color 0c
Call :Logo
Echo Welcome %UserName%.
Set "inPass="
Set /P "inPass=Password>" || GoTo Boot
Set inPass | %SystemRoot%\System32\findstr.exe /XLIC:"inpass=12345678" 1>NUL
If ErrorLevel 1 GoTo Boot
If ErrorLevel 0 GoTo Submenu

:Submenu
color 01
Call :Logo
Echo Choose an option
Echo(
Call :ColorText 0d "1. Apps"
Echo(
Call :ColorText 0e "2. Settings"
Echo(
Call :ColorText 0a "3. Reboot"
Echo(
Call :ColorText 09 "4. Shutdown"
Echo(
Call :ColorText 08 "5. Sleep"
Echo(
%SystemRoot%\System32\choice.exe /C 12345
If ErrorLevel 5 GoTo sleep
If ErrorLevel 4 exit
If ErrorLevel 3 GoTo Boot
If ErrorLevel 2 GoTo menu2
If ErrorLevel 1 GoTo Menu

:sleep
Call :Logo
pause
Goto :Submenu

:Menu
color 0b
Call :Logo
Echo Apps menu
Call :ColorText 01 " 1. Notepad"
Call :ColorText 02 " 2. Calculator"
Call :ColorText 03 " 3. Command Prompt"
Call :ColorText 04 " 4. Go Back"
Echo(
%SystemRoot%\System32\choice.exe /C 12345
If ErrorLevel 4 GoTo Submenu
If ErrorLevel 3 (
  Cls
  Pause
  Cls
  Call :Logo
  Echo NOTE: exiting it will take you to the settings menu 
  %SystemRoot%\System32\cmd.exe
)
If ErrorLevel 2 GoTo a
If ErrorLevel 1 GoTo notepad

:menu2
Cls
color 0c
Call :Logo
Echo Settings
Call :ColorText 06 " 1. System info"
Call :ColorText 07 " 2. OS info"
Call :ColorText 08 " 3. Go back"
Echo(
%SystemRoot%\System32\choice.exe /C 123
If ErrorLevel 3 GoTo Submenu
If ErrorLevel 2 GoTo info
If ErrorLevel 1 (
  Cls
  Color 06
  Call :Logo
  %SystemRoot%\System32\systeminfo.exe /Fo List
  Pause
  GoTo menu2
)

:notepad
Cls
Color 01
Call :Logo
Echo ________Notepad________
Set /p t= 
GoTo sec2

:sec2
Cls
Call :Logo
Echo ________Notepad________
Echo %t%
Echo Command or text?
Set /p t= 
If %t% == clear GoTo notepad
If %t% == exit GoTo Menu
GoTo sec2

:a
Color 02
Cls
Call :Logo
Echo ________Calculator________
Echo.
Set /p expression= Enter expression to calculate or type exit to exit:
If %expression% == exit GoTo :Menu
Set /a ans=%expression%
Echo.
Echo = %ans%
Echo
Pause
Cls
GoTo a

:info
ClS
Color 06
Call :Logo
Echo OS simplebatch version 1.0
Echo Codename simplecolr
Echo Build 5.4.6
Echo Release notes: got some errors on some apps, mate
Pause
GoTo menu2