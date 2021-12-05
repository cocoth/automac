#!/usr/bin/env bash
if [ $EUID -ne 0 ]; then # Super User Check
	echo -e "\\033[31mAborted, please execute the script as root.\\033[0m"; exit 1
fi

apt update -y
apt install macchanger -y 


echo "done"
echo "running script"
chmod +x AutoChangeMac.sh
./AutoChangeMac.sh