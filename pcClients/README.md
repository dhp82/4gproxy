## Where can I get the proxies address
It will generate a file "proxy.info" in the working directory if the pc client is connected, the content likes:
```
{"proxies":
{"d3a849f6c55ea765058bc72ded1cfd91":{"connectedAt":"2019-09-03 14:08:08 +0800","proxyUrl":"http://192.168.2.100:53636"},"6d5ada3b1b0f9fadde94c6dc081dba69":{"connectedAt":"2019-09-03 14:08:08 +0800","proxyUrl":"http://192.168.2.100:53625"}}}
```
## Supports for multple network adapters

### Requirement
1. Any OS, but android usb thethring is easier in Windows, for macOS, you have to install driver. See [here](https://github.com/jwise/HoRNDIS)
2. Android phone Or 4g Modem
     
### How can I know which proxy is which device
You can know it by the ip address now.
```
curl ifconfig.me
curl icanhazip.com
curl ifconfig.co
curl ip.cn

-- get IP of a proxy
curl --proxy http://192.168.2.100:53625 ifconfig.me
```

## Install PC client as service
1. You need to assign [execute] permission for allproxyC in linux env
```bash
chmod +x allproxyC
```
2. Install it as daemon service 
```bash
allproxyC -i
```
3. Check its status
```bash
allproxyC -q
```

## Help
You can get all valid parameters by:
```bash
allproxyC -h
```
Valid Options:

  -h    this help

  -i    install as deamon service

  -q    query the service status

  -s signal
        send signal to IgerslikeProxy: stop, restart, start

  -server string
        The server address

  -u    uninstall deamon service

  -userId string
        The user id

  -w string
        The working directory,default is the current directory

## Limitations
- You can create at most 2 proxies in one free PC client.

## Contact me
If you want to use your self allproxy server to make better security and speed, pls feel free to contact me by email/skype: mailme.xu@gmail.com
