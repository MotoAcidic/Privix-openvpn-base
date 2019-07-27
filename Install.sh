#!/bin/bash
# Copyright (c) 2019 Privix. Released under the MIT License.

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=6
BACKTITLE="VPX Setup Wizard"
TITLE="VPX VPS Setup"
MENU="Choose one of the following options:"

OPTIONS=(1 "Install Privix Daemon"
		 2 "Install Privix Masternode"
		 3 "Update Privix Daemon and CLI"
         3 "Install Ubuntu 16.04 Privix VPN"
		 4 "Install Ubuntu 18 Privix VPN"
)


CHOICE=$(whiptail --clear\
		--backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
		cd &&  bash -c "$(wget -O - https://raw.githubusercontent.com/MotoAcidic/Privix-openvpn-base/master/Scripts/Daemon/daemon-install.sh)"
        ;;
	    
        2)
		cd &&  bash -c "$(wget -O - https://raw.githubusercontent.com/MotoAcidic/Privix-openvpn-base/master/Scripts/Masternode/masternode-install.sh)"
		;;

		3)
		cd &&  bash -c "$(wget -O - https://raw.githubusercontent.com/MotoAcidic/Privix-openvpn-base/master/Scripts/Update/update-install.sh)"
		;;

		4)
		cd &&  bash -c "$(wget -O - https://raw.githubusercontent.com/MotoAcidic/Privix-openvpn-base/master/Scripts/Ubuntu16.04/16-vpn-install.sh)"
		;;

		5)
		cd &&  bash -c "$(wget -O - https://raw.githubusercontent.com/MotoAcidic/Privix-openvpn-base/master/Scripts/Ubuntu18/18-vpn-install.sh)"
esac