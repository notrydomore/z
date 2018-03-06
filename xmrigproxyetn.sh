#!/bin/bash

echo "---UPDATING SYSTEM---"
apt-get update --assume-yes

echo "---INSTALL DEPENDENCING---"
sudo apt-get --assume-yes install git build-essential cmake libuv1-dev uuid-dev libmicrohttpd-dev

echo "---DOWNLOAD,COMPILE, INSTALL AND CONFIGURE XMRIG-PROXY"
git clone https://github.com/xmrig/xmrig-proxy.git
cd xmrig-proxy
mkdir build
cd build
cmake ..
make

echo "--MAKE EXECUTABLE CUSTOM FILE---"
echo "screen ./xmrig-proxy -o pool.electroneum.hashvault.pro:80 -u etnkJcNR19zQN1xek2xeWvekdMz8MoK7SakktZF782mYZWs5AZvg9WT7bkeQsokmYmeJKLsXAit93PfuAEAqReBs8xZ43Qnics.lead2 -p x --bind 0.0.0.0:3333" >> miner

echo "---SET EXECUTABLE RUNNING AT REBOOT---"
(crontab -l 2>/dev/null; echo "@reboot screen -d -m /root/miner")| crontab -
reboot
