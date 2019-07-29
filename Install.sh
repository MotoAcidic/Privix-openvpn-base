#!/bin/bash
# Copyright (c) 2019 Privix. Released under the MIT License.

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=6
BACKTITLE="VPX Setup Wizard"
TITLE="VPX VPS Setup"
MENU="Choose one of the following options:"

OPTIONS=(1 "Go To Privix Daemon / MasterNode Setup"
		 2 "Go To Privix IPSEC Setup"
		 3 "Go To Privix VPN Setup"
		 4 "Go To Privix PPTP Setup"
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
        1)	# Privix Node	
		cd &&  bash -c "$(wget -O - https://git.io/fjyAI)"
        ;;
	    
        2)  # IPSEC
		cd &&  bash -c "$(wget -O - https://git.io/fjyAq)"
		;;

		3)  # VPN
		cd &&  bash -c "$(wget -O - https://git.io/fjybM)"
		;;

		4)  # PPTP
		cd &&  bash -c "$(wget -O - https://git.io/fjyb1)"
		;;
esac