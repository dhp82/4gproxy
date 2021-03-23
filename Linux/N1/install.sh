#!/bin/bash

curTime=$(date "+%Y%m%d%H%M%S")

echo "createing directory"
mkdir -p ~/allproxyClient

echo "Downloading the allproxy client $curTime"
curl -O -k  https://nxu_xa.coding.net/p/allp/d/allp/git/raw/master/Linux/arm/allproxyclient

echo "Downloading the config gile $curTime"
curl -O -k  https://nxu_xa.coding.net/p/allp/d/allp/git/raw/master/Linux/arm/conf_client.yaml

echo "Downloading the  clientUtil $curTime"
curl -O -k https://nxu_xa.coding.net/p/allp/d/allp/git/raw/master/Tools/clientUtilities/linux/arm/clientUtilities


echo "overwirte with the new client"
mv -f allproxyclient ~/allproxyClient/allproxyC
mv -f conf_client.yaml ~/allproxyClient/
mv -f clientUtilities ~/allproxyClient/

echo "set execute permission to script"
chmod +x ~/allproxyClient/allproxyC
chmod +x ~/allproxyClient/clientUtilities


echo "Beging installl network script"
curl -o 90upallprxy -k https://nxu_xa.coding.net/p/allp/d/allp/git/raw/master/Raspberry/4B/update/90upallprxy
curl -o 90downallprxy -k https://nxu_xa.coding.net/p/allp/d/allp/git/raw/master/Raspberry/4B/update/90downallprxy

mv -f 90upallprxy /etc/network/if-up.d/
echo "set execute permission to script"
chmod +x /etc/network/if-up.d/90upallprxy

echo "overwirte with the new script"
mv -f 90downallprxy /etc/network/if-post-down.d/

echo "set execute permission to script"
chmod +x /etc/network/if-post-down.d/90downallprxy

echo "Done, you can now edit ~/allproxyClient/conf_client.yaml with your server address, and run ~/allproxyClient/allproxyC"

