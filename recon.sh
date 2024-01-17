#!/bin/bash

#echo -e "${GREEN}  _ __ ___  ___ ___  _ __  "
#echo -e         " | '__/ _ \/ __/ _ \| '_ \ "
#echo -e         " | | |  __/ (_| (_) | | | |"
#echo -e         " |_|  \___|\___\___/|_| |_| ${ENDCOLOR}"

if [ $# -eq 0 ]; then
    echo -e "Provide a Target :${YELLOW} $0 ${RED}<target> ${ENDCOLOR}"
    exit 1
fi

RED="\e[31m"
YELLOW="\e[33m"
GREEN="\e[92m"
ENDCOLOR="\e[0m"

BOLD=$(tput bold)
NORMAL=$(tput sgr0)

DOMAIN=$1
FILE_PATH=${DOMAIN}.txt

if [ -e $FILE_PATH ]; then
    echo -e "\nReport File Exists. Overwriting the Report"
    rm -f $FILE_PATH
    touch $FILE_PATH
else
    touch $FILE_PATH
fi


ping -c 3 -W 2 8.8.8.8 >/dev/null 2>&1 && AVAILABLE=1 || AVAILABLE=0

if [ $AVAILABLE -eq 0 ]; then
    echo -e "${RED}No Internet Connection${ENDCOLOR}"
    exit 1
else 
    echo -e "${GREEN}Internet Connection Available${ENDCOLOR}"
fi
