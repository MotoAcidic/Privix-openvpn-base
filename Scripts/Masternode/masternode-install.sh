#!/bin/bash
# Copyright (c) 2019 Privix. Released under the MIT License.

echo Starting the install process.
echo Checking and installing VPS server prerequisites. Please wait.
echo -e "Checking if swap space is needed."
PHYMEM=$(free -g|awk '/^Mem:/{print $2}')
SWAP=$(swapon -s)
if [[ "$PHYMEM" -lt "2" && -z "$SWAP" ]];
  then
    echo -e "${GREEN}Server is running with less than 2G of RAM, creating 2G swap file.${NC}"
    dd if=/dev/zero of=/swapfile bs=1024 count=2M
    chmod 600 /swapfile
    mkswap /swapfile
    swapon -a /swapfile
else
  echo -e "${GREEN}The server running with at least 2G of RAM, or SWAP exists.${NC}"
fi
if [[ $(lsb_release -d) != *16.04* ]]; then
  echo -e "${RED}You are not running Ubuntu 16.04. Installation is cancelled.${NC}"
  exit 1
fi

if [[ $EUID -ne 0 ]]; then
   echo -e "${RED}$0 must be run as root.${NC}"
   exit 1
fi
clear
sudo apt update
sudo apt-get -y upgrade
sudo apt-get install git -y
sudo apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils -y
sudo apt-get install libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev -y
sudo apt-get install libboost-all-dev -y
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:bitcoin/bitcoin -y
sudo apt-get update
sudo apt-get install libdb4.8-dev libdb4.8++-dev -y
sudo apt-get install libminiupnpc-dev -y
sudo apt-get install libzmq3-dev -y
sudo apt-get install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler -y
sudo apt-get install libqt4-dev libprotobuf-dev protobuf-compiler -y
clear
echo VPS Server prerequisites installed.


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

echo Downloading Vpx install files.
wget https://github.com/privix/vpx/releases/download/v.2.0.0.1/privix-v2.0.0.1-ubu1604.tar.gz
echo Download complete.

echo Installing Privix.
tar -xvf privix-v2.0.0.1-ubu1604.tar.gz
chmod 775 ./privixd
chmod 775 ./privix-cli
echo VPX install complete. 
sudo rm -rf privix-v2.0.0.1-ubu1604.tar.gz
clear


echo Now ready to setup Vpx configuration file.

RPCUSER=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
RPCPASSWORD=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
EXTIP=`curl -s4 icanhazip.com`
echo Please input your private key.
read GENKEY

mkdir -p /root/.privix && touch /root/.privix/privix.conf

cat << EOF > /root/.privix/privix.conf
rpcuser=$RPCUSER
rpcpassword=$RPCPASSWORD
rpcallowip=127.0.0.1
server=1
listen=1
daemon=1
staking=1
rpcallowip=127.0.0.1
rpcport=7789
port=7788
masternode=1
masternodeprivkey=$GENKEY
logtimestamps=1
maxconnections=256
addnode=8.9.36.49
addnode=140.82.48.162
externalip=$EXTIP
EOF
clear

./privixd -daemon
./privix-cli stop
sleep 10s # Waits 10 seconds
./privix -daemon
clear
echo Vpx configuration file created successfully. 
echo Vpx Server Started Successfully using the command ./privixd -daemon
echo If you get a message asking to rebuild the database, please hit Ctr + C and run ./privixd -daemon -reindex
echo If you still have further issues please reach out to support in our Discord channel. 
echo Please use the following Private Key when setting up your wallet: $GENKEY
fi