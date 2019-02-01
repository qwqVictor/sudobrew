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
echo -e "Are you sure you want to uninstall this project?"
echo -e "It will change the system directories' ownership to you, like Homebrew does."
echo -e "${RED}Warning: ${TAILS} This is an alpha version, try it at your own risk. If you want to stop, press Control-C."
printf "Press any key to continue..."
echo "Changing the ownership of Homebrew directories..."
sudo chown -R $(whoami) /usr/local/bin /usr/local/etc /usr/local/include /usr/local/lib /usr/local/sbin /usr/local/share /usr/local/var /usr/local/Frameworks /usr/local/opt /usr/local/Cellar /usr/local/Homebrew
sudo chmod -R 755 /usr/local/Caskroom
echo "Removing commands..."
sudo rm -f /usr/local/bin/pkg /usr/local/bin/cask /usr/local/bin/services
echo "Done."