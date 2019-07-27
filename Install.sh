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
         4 "Install Ubuntu 16.04 Privix VPN"
		 5 "Install Ubuntu 18 Privix VPN"
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
        1)	# Daemon	
		cd &&  bash -c "$(wget -O - https://git.io/fjyrb)"
        ;;
	    
        2)  # Masternode
		cd &&  bash -c "$(wget -O - https://git.io/fjyrN)"
		;;

		3)  # Update Daemon and CLI
		cd &&  bash -c "$(wget -O - https://git.io/fjyrA)"
		;;

		4)  # Install VPN 16.04
		cd &&  bash -c "$(wget -O - https://git.io/fjyrp)"
		;;

		5)  # Install VPN 18
		cd &&  bash -c "$(wget -O - https://git.io/fjyrh)"
esac