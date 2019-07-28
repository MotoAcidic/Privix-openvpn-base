## Privix VPN Install
Privix VPN [road warrior](http://en.wikipedia.org/wiki/Road_warrior_%28computing%29) installer for Debian, Ubuntu and CentOS.

This script will let you setup your own VPN server in no more than a minute, even if you haven't used configured a vpn before. It has been designed to be as unobtrusive and universal as possible.

### Menu Option
* Option 1 will install the Privix-core daemon only
* Option 2 will install everything for running a masternode on the Privix network
* Option 3 will update all files (privixd / privix-cli)
* Option 4 will install the Privix vpn on Ubuntu 16.04
* Option 5 will install the Privix vpn on Ubuntu 18.04

### Installation
Run the script and follow the assistant:

```
cd &&  bash -c "$(wget -O - https://raw.githubusercontent.com/MotoAcidic/Privix-openvpn-base/master/Install.sh)"
```

* After you have installed the VPN keep note of the cert name you choose during the installation. (Default cert name is client)

* You will need to now export your cert you got during the install with a client like winscp [Winscp Install](https://winscp.net/eng/index.php)

* Navigate to cd /root/  and copy over your cert file to your desktop

* In order for your to connect to your vpn you will need to install either the openvpn gui here [OoenVpn GUI](https://openvpn.net/community-downloads/)
or install [Pritunl](https://client.pritunl.com/)

* Once you have installed either gui client your will need to import the cert from above into the client and connect.

