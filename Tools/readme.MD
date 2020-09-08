The tool is not requeid for using allproxy.

## clientUtilities
You can use clientUtilities to do IP reset for Huawei E3372/E8372, the valid command formt is

```
clientUtilities -deviceMode e3372 -params $IP
or
clientUtilities -deviceMode e8372 -params $IP#user#password
```

if you want to do reboot:

```
clientUtilities -deviceMode e8372 -params $IP#user#password -command reboot
or
clientUtilities -deviceMode e3372 -params $IP -command reboot
```

## setDHCP.exe
A tool which can change the DHCP of huaweiE3372

## wpa_cli
Android wifi debug tool