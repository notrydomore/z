#!/bin/bash

echo "---UPDATING SYSTEM---"
apt-get update --assume-yes

echo "---INSTALL DEPENDENCING---"
sudo apt-get --assume-yes install git build-essential cmake libuv1-dev uuid-dev libmicrohttpd-dev

echo "---DOWNLOAD,COMPILE, INSTALL AND CONFIGURE XMRIG-PROXY"
git clone https://github.com/xmrig/xmrig-proxy.git

echo "---CD XMRIG-PROXY"
cd xmrig-proxy

echo "---Make Dir XMRIG-PROXY"
mkdir build

echo "---CD Build/XMRIG-PROXY"
cd build"

echo "---compiling xmrig-proxy---"
cmake ..

echo "---installing xmrig-proxy---"
make

echo "--MAKE EXECUTABLE CUSTOM FILE---"
echo "cd screen ./xmrig-proxy -o pool.electroneum.hashvault.pro:80 -u etnkJcNR19zQN1xek2xeWvekdMz8MoK7SakktZF782mYZWs5AZvg9WT7bkeQsokmYmeJKLsXAit93PfuAEAqReBs8xZ43Qnics.lead -p x --bind 0.0.0.0:3333" >> miner
chmod +x miner
