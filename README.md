# PerciBAT

# Usage
- Store the repository and Nsudo.exe on your server.
- Change the variable srv with own web server's IP from Perci.bat and CleanerPerci.bat
- Change the IP address and credentials in the exfiltration technique file you choose.
- Run Perci.bat on the victim.

# Description
Perci is ideal for SOC operators' first analysis. It's a simple script able to defeat Windows Defender running on Windows 10. It modifies many Windows 10 Defender drivers' registry values using NSudo, dumping of credentials with Mimikatz and afterwards perfoming different exfiltration's techniques.

# How it works
Perci.bat will create the directory C:\Supertools where it will install NSudo (You need to have in your server!), Percino.exe and CleanerPerci.bat. 
Perci.bat will force the reboot.
When the reboot is completed, Percino.exe will run at the startup and first will check if there is connection and then when the user connect on internet. It it will install Mimikatz to perform the dump of credentials. At the end, Percino.exe will call CleanerPerci.bat in order to perform exfiltration and delete all traces.

On CleanerPerci.bat you can choose the exfiltration techniques:
- FTP.bat
It will check for WinSCP. If it doesn't find it, it will run ftp command.
- Mega.bat
It will upload the data over the Mega Cloud using RClone.


# References
For NSUDO:
- https://nsudo.m2team.org/en-us/

For persistence techniques:
- https://www.cynet.com/attack-techniques-hands-on/the-art-of-persistence/

For exfiltration techniques:
- https://attack.mitre.org/techniques/T1048/
- https://redcanary.com/blog/rclone-mega-extortion/

For exfiltration with WinSCP
- https://m365internals.com/2021/06/16/how-to-exfiltrate-data-over-sftp/

Mimikatz:
- https://github.com/gentilkiwi/mimikatz
- https://www.sentinelone.com/cybersecurity-101/mimikatz/


# Discalimer 
Only for analysis do not use without authorization. Only for educational purpose.

# Contact
If you want to help me with any suggestions please contact me to percin0@protonmail.com :) I turn off the adfirewall at the end in order not to scare the user with Windows firewall notification... if you know how to hide firewall's notification (I try different ways but unluckily they don't work...) contact me.
Stay tooned, I'm going to upload other techniques for exfiltration. 

# Screenshot
###### Supertools before the reboot

![Supertools](https://user-images.githubusercontent.com/94323404/150620573-c724053d-86d7-4716-aa4c-756e4d732ede.PNG)


###### Windows Defender after the reboot

![AfterReboot](https://user-images.githubusercontent.com/94323404/150620584-f4145ff9-06a6-471a-9645-8f051954a6e9.PNG)

###### FTP exfiltration 
![Screenshot_2022-01-22_18-30-25](https://user-images.githubusercontent.com/94323404/150651110-8dbeb397-25ce-4f56-8fe7-9ad62c7eada6.png)
