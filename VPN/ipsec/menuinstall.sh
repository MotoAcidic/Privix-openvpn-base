#!/bin/bash
# Copyright (c) 2019 Privix. Released under the MIT License.

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=6
BACKTITLE="VPX Setup Wizard"
TITLE="VPX VPS Setup"
MENU="Choose one of the following options:"

OPTIONS=(1 "Install Brand New Privix IPSEC"
		 2 "Add New User"
		 3 "Delete User"
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
        1)	# Fresh Install
		cd &&  bash -c "$(wget -O - https://git.io/fjyb0)"
        ;;
	    
        2)  # Add New User
		cd &&  bash -c "$(wget -O - https://git.io/fjybu)"
		;;

		3)  # Delete User
		cd &&  bash -c "$(wget -O - https://git.io/fjybz)"
		;;

		4)  # Go Back
		cd &&  bash -c "$(wget -O - https://git.io/fjyb4)"
		;;
esac