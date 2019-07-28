#!/bin/bash
# Copyright (c) 2019 Privix. Released under the MIT License.

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=6
BACKTITLE="VPX Setup Wizard"
TITLE="VPX VPS Setup"
MENU="Choose one of the following options:"

OPTIONS=(1 "Go To Privix Node Setup"
		 2 "Go To VPN Setup"
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
		cd &&  bash -c "$(wget -O - https://git.io/fjybB)"
		;;
esac