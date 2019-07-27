#!/bin/bash
# Copyright (c) 2019 Privix. Released under the MIT License.

killall -9 privixd
echo "! Stopping VPX Daemon !"

echo Configuring server firewall.
sudo apt-get install -y ufw
sudo ufw allow 7789
sudo ufw allow 7789/tcp
sudo ufw allow 7789/udp
sudo ufw allow 7788
sudo ufw allow 7788/tcp
sudo ufw allow 7788/udp
sudo ufw allow ssh/tcp
sudo ufw limit ssh/tcp
sudo ufw logging on
echo "y" | sudo ufw enable
sudo ufw status
echo Server firewall configuration completed.
rm -rf privixd
rm -rf privix-cli

wget wget https://github.com/privix/vpx/releases/download/v.2.0.0.1/privix-v2.0.0.1-ubu1604.tar.gz
echo Download complete.
echo Installing VPX.
tar -xvf privix-v2.0.0.1-ubu1604.tar.gz
chmod 775 ./privixd
chmod 775 ./privix-cli
sudo rm -rf privix-v2.0.0.1-ubu1604.tar.gz
./privixd -daemon
cd
echo VPX install complete.
fi