#!/bin/bash
BLACK="\033[30m"        
RED="\033[31m"          
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
PURPLE="\033[35m"
SKY_BLUE="\033[36m"
WHITE="\033[37m"        
BLACK_WHITE="\033[40;37m" 
RED_WHITE="\033[41;37m"   
GREEN_WHITE="\033[42;37m" 
YELLOW_WHITE="\033[43;37m"
BLUE_WHITE="\033[44;37m"  
PURPLE_WHITE="\033[45;37m"
WHITE_BLACK="\033[47;30m" 
SKY_BLUE_WHITE="\033[46;37m"
FLICKER="\033[05m"
BOLD="\033[;1m"
TAILS="\033[0m"

cd `dirname $0` 2> /dev/null
echo -e "This project could fix broken permissions which caused by Homebrew."
echo -e "This script will ask your sudo password in need."
echo -e "${RED}Warning: ${TAILS} If brew command updates, this version may not work. And now this is an alpha version."
echo -e "          Try it at your own risk. If you want to stop, press Control-C."
printf "Press any key to continue..."
read -sn 1
echo -e "\n\n";
echo -e "Repairing Permissions..."
sudo chown root:wheel /usr/local/bin /usr/local/etc /usr/local/include /usr/local/lib /usr/local/sbin /usr/local/share /usr/local/var /usr/local/Frameworks /usr/local/opt
sudo chown -R root:wheel /usr/local/Cellar /usr/local/Homebrew
sudo chown -R root:staff /usr/local/Caskroom
sudo chmod -R 775 /usr/local/Caskroom
echo -e "Initializing config file..."
sudo touch /etc/defaults/homebrew.conf
sudo cp bin/cask /usr/local/bin
sudo cp bin/pkg /usr/local/bin
sudo cp bin/services /usr/local/bin
sudo chmod a+x /usr/local/bin/cask /usr/local/bin/pkg /usr/local/bin/services
echo -e "Done."
echo -e "\n\n"
echo -e "Please use: "
echo -e "	\`${BOLD}${FLICKER}pkg${TAILS}\` for installing packages,"
echo -e "	\`${BOLD}${FLICKER}cask${TAILS}\` for installing casks,"
echo -e "	\`${BOLD}${FLICKER}services${TAILS}\` for controlling services via brew"
echo -e "instead of using original brew, which is deprecated after this procedure."
echo -e "Please move your homebrew config to /etc/defaults/homebrew.conf with shell syntax."