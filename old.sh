#echo -e "\n${RED}${BOLD}<-- Nslookup Report --> ${NORMAL}${ENDCOLOR} \n" > $DIRECTORY/report
echo -e "\nRunning nslookup..."
nslookup $DOMAIN >> $DIRECTORY/report

#echo -e "\n${RED}${BOLD}<-- Nmap Report --> ${NORMAL}${ENDCOLOR} \n" >> $DIRECTORY/report
echo "Running nmap..."
echo -e "Open Ports :\n" >> $DIRECTORY/report
nmap $DOMAIN > $DIRECTORY/.nmap
cat $DIRECTORY/.nmap | grep "open" >> $DIRECTORY/report

#echo -e "\n${RED}${BOLD}<-- AssetFinder Report --> ${NORMAL}${ENDCOLOR} \n" >> $DIRECTORY/report
echo "Running assetfinder..."
assetfinder $DOMAIN > $DIRECTORY/.assets
cat $DIRECTORY/.assets | sort >> $DIRECTORY/report

#echo -e "\n${RED}${BOLD}<-- SubFind3r Report --> ${NORMAL}${ENDCOLOR} \n" >> $DIRECTORY/report
echo "Running subfind3r..."
subfinder -d $DOMAIN > $DIRECTORY/.subfind3r
cat $DIRECTORY/.subfind3r | sort >> $DIRECTORY/report

#echo -e "\n${RED}${BOLD}<-- WhatWeb Report --> ${NORMAL}${ENDCOLOR} \n" >> $DIRECTORY/report
echo -e "\nRunning whatweb..."
whatweb $DOMAIN > $DIRECTORY/.whatweb
sed 's/,/,\
/g' $DIRECTORY/.whatweb >> $DIRECTORY/report

#echo -e "\n${RED}${BOLD}<-- PING Report --> ${NORMAL}${ENDCOLOR} \n" >> $DIRECTORY/report
echo "Pinging the target..."
ping -c 3 $DOMAIN >> $DIRECTORY/report


echo -e "\nThe Results are stored in${YELLOW} $DIRECTORY/report ${ENDCOLOR}"