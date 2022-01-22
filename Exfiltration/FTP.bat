echo off

rem insert the FTP server address & port and the credentials
set dir=WinSCP\
set srv=SERVER
set port=PORT
set usr=anonymous
set pass=anonymous

cd C:\Program Files (x86)
IF EXIST %dir% (
cd WinSCP
winscp.com /command "open ftp://%usr%:%pass%@%srv%:%port%/" "put C:\Supertools\PS.txt" "exit"
) ELSE (
echo open %srv% %port% > ftpcmd.dat
echo user %usr% >> ftpcmd.dat
echo %pass% >> ftpcmd.dat
echo put C:\Supertools\PS.txt >> ftpcmd.dat
echo quit>> ftpcmd.dat
ftp -n -s:ftpcmd.dat 
del ftpcmd.dat
)
