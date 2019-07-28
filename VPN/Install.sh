#!/bin/bash
# Copyright (c) 2019 Privix. Released under the MIT License.

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=6
BACKTITLE="VPX Setup Wizard"
TITLE="VPX VPN Setup Menu"
MENU="Choose one of the following options:"

OPTIONS=(1 "Install Privix IPSEC"
		 2 "Install Privix VPN"
		 3 "Install Privix PPTP"
         4 "Go Back"
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
        1)	# IPSEC	
		cd &&  bash -c "$(wget -O - https://git.io/fjyb1)"
        ;;
	    
        2)  # VPN
		cd &&  bash -c "$(wget -O - https://git.io/fjybM)"
		;;

		3)  # PPTP
		cd &&  bash -c "$(wget -O - https://git.io/fjyb1)"
		;;

		4)  # Go Back
		cd &&  bash -c "$(wget -O - https://git.io/fjyb4)"
		;;
esac