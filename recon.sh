#!/bin/bash

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
DIRECTORY=${DOMAIN}_recon


echo -e "${GREEN}  _ __ ___  ___ ___  _ __  "
echo -e         " | '__/ _ \/ __/ _ \| '_ \ "
echo -e         " | | |  __/ (_| (_) | | | |"
echo -e         " |_|  \___|\___\___/|_| |_| ${ENDCOLOR}"

if [ -d $DIRECTORY ]; then
    echo -e "\n${RED}Report Exists. Overwriting the Report ${ENDCOLOR}"
    rm -rf $DIRECTORY
    mkdir $DIRECTORY
else
    mkdir $DIRECTORY
fi


echo -e "\n${RED}${BOLD}<-- Nslookup Report --> ${NORMAL}${ENDCOLOR} \n" > $DIRECTORY/report
echo -e "\nRunning nslookup..."
nslookup $DOMAIN >> $DIRECTORY/report

echo -e "\n${RED}${BOLD}<-- Nmap Report --> ${NORMAL}${ENDCOLOR} \n" >> $DIRECTORY/report
echo "Running nmap..."
echo -e "Open Ports :\n" >> $DIRECTORY/report
nmap $DOMAIN > $DIRECTORY/.nmap
cat $DIRECTORY/.nmap | grep "open" >> $DIRECTORY/report

echo -e "\n${RED}${BOLD}<-- AssetFinder Report --> ${NORMAL}${ENDCOLOR} \n" >> $DIRECTORY/report
echo "Running assetfinder..."
assetfinder $DOMAIN > $DIRECTORY/.assets
cat $DIRECTORY/.assets | sort >> $DIRECTORY/report

echo -e "\n${RED}${BOLD}<-- SubFind3r Report --> ${NORMAL}${ENDCOLOR} \n" >> $DIRECTORY/report
echo "Running subfind3r..."
subfinder -d $DOMAIN > $DIRECTORY/.subfind3r
cat $DIRECTORY/.subfind3r | sort >> $DIRECTORY/report

echo -e "\n${RED}${BOLD}<-- WhatWeb Report --> ${NORMAL}${ENDCOLOR} \n" >> $DIRECTORY/report
echo -e "\nRunning whatweb..."
whatweb $DOMAIN > $DIRECTORY/.whatweb
sed 's/,/,\
/g' $DIRECTORY/.whatweb >> $DIRECTORY/report

echo -e "\n${RED}${BOLD}<-- PING Report --> ${NORMAL}${ENDCOLOR} \n" >> $DIRECTORY/report
echo "Pinging the target..."
ping -c 3 $DOMAIN >> $DIRECTORY/report


echo -e "\nThe Results are stored in${YELLOW} $DIRECTORY/report ${ENDCOLOR}"
