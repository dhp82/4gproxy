## ver85
We removed uniqueId storage in local file according customer request. Because it will hard to do backup and move the new phone.

## **Ver84** -- Save the Reconnection time
We optimized reconection logic in this version, so the average reconnection time is decreased, from 10s to 5s

## Version 83
1. Pls don't use version 80 ~ 82, it used wrong package id, so it will makes proxy port difference
2. We fixed package id issue
3. Move big blue button to bottom

## Version 82
Added 2 seconds delay during airplane off/on

## Supports IPRotation for non-rooted phone (from version 80)
https://blog.allproxy.io/2022/05/10/ip-rotation-for-r-non-rooted-devices/


## The options file (from version 76)
If you want change the options file programmatically, you can just change the file which $Android_DATA/io.allproxy.peerproxy/app_flutter/options.json

e.g:
Some phone may have same uniqueId in some time, you can just edit "uid" is this file to use another uqiqueId

