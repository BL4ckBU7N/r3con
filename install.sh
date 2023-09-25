#!/bin/bash

CYAN="\e[96m"
ENDCOLOR="\e[0m"


if command -v nmap &> /dev/null && 
   command -v nslookup &> /dev/null && 
   command -v assetfinder &> /dev/null && 
   command -v subfinder &> /dev/null && 
   command -v whatweb &> /dev/null; then

    echo -e "${CYAN}Required Tools are Installed!${ENDCOLOR}"
    exit 1
fi


sudo apt update

if ! command -v nmap &> /dev/null; then
    echo "Installing Nmap..."
    sudo apt install nmap
else
    echo -e "${CYAN}Nmap is already installed. ${ENDCOLOR}"
fi

if ! command -v nslookup &> /dev/null; then
    echo "Installing NsLookup..."
    sudo apt install nslookup
else
    echo -e "${CYAN}NsLookup is already installed. ${ENDCOLOR}"
fi

if ! command -v assetfinder &> /dev/null; then
    echo "Installing AssetFinder..."
    sudo apt install assetfinder
else
    echo -e "${CYAN}AssetFinder is already installed. ${ENDCOLOR}"
fi

if ! command -v subfinder &> /dev/null; then
    echo "Installing SubFinder..."
    sudo apt install subfiner
else
    echo -e "${CYAN}WhatWeb is already installed. ${ENDCOLOR}"
fi

if ! command -v whatweb &> /dev/null; then
    echo "Installing WhatWeb..."
    sudo apt install whatweb
else
    echo -e "${CYAN}WhatWeb is already installed. ${ENDCOLOR}"
fi