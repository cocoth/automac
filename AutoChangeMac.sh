#!/usr/bin/env bash

clear
if [ $EUID -ne 0 ]; then # Super User Check
	echo -e "\\033[31mAborted, please execute the script as root.\\033[0m"; exit 1
fi

usage(){
	echo ""
	echo -en "enter your interface: "
	read pilihan

	if [[ $0 > 1 ]]; then
		if [[ $pilihan < 1 ]]; then
			echo ""
			echo -e "INTERFACE NOT VALID!"
			usage
			exit
		fi
		if [[ $pilihan > 1 ]]; then
			mate-terminal  --hide-menubar --geometry=93x41+1+0 -t monitoring -x airodump-ng $pilihan
			exit 0 &
			echo -en "Enter TARGET: "
			read t 
			ifconfig $pilihan down
			macchanger -m $t | grep "New MAC: "
			ifconfig $pilihan up
			exit
		fi

	fi


}

echo -e "\033[32;1m*-----------------------------------------------------------------------------------------------*\033[0m"
echo -e "\033[32;1m|                                                                                               |\033[0m"
echo -e "\033[32;1m|                                                                                               |\033[0m"
echo -e "\033[32;1m|                                       \033[0;36m[ HACKING PROGRAMS ]\033[0m                                    \033[32;1m|\033[0m"
echo -e "\033[32;1m|                                    \033[37;1m{   buid by MR.SystemX   }\033[0m                                 \033[32;1m|\033[0m"
echo -e "\033[32;1m|                                                                                               \033[32;1m|\033[0m"
echo -e "\033[32;1m|                                                                                               \033[32;1m|\033[0m"
echo -e "\033[32;1m*-----------------------------------------------------------------------------------------------*\033[0m"
echo -e ""
echo -e ""
echo -e "\033[37;1m=========================================>\033[0m\033[0;36m MACCHANGER \033[0m\033[37;1m<=========================================\033[0m "
echo -e ""

if [[ $1 < 0 ]]; then
	usage
fi
if [[ $1 > 0 ]]; then
	mate-terminal  --hide-menubar --geometry=93x41+1+0 -t monitoring -x airodump-ng $1
	exit 0 &
	echo -en "Enter TARGET: "
	read t 
	ifconfig $1 down
	macchanger -m $t | grep "New MAC: "
	ifconfig $1 up
	exit
fi
