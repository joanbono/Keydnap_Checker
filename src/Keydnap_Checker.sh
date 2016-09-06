#!/bin/bash
# Search listed files by ESET on welivesecurity
# http://www.welivesecurity.com/2016/08/30/osxkeydnap-spreads-via-signed-transmission-application/
# Version: 0.1

RED='\033[0;31m'
NOCOLOR='\033[0m'
GREEN='\033[0;32m'
FLAG='0'

for line in /Applications/Transmission.app/Contents/Resources/License.rtf \
/Volumes/Transmission/Transmission.app/Contents/Resources/License.rtf \
$HOME/Library/Application\ Support/com.apple.iCloud.sync.daemon/icloudsyncd \
$HOME/Library/Application\ Support/com.apple.iCloud.sync.daemon/process.id \
$HOME/Library/LaunchAgents/com.apple.iCloud.sync.daemon.plist \
$HOME/Library/LaunchAgents/com.geticloud.icloud.photo.plist \
/Library/Application\ Support/com.apple.iCloud.sync.daemon \
$HOME/Library/LaunchAgents/com.geticloud.icloud.photo.plist; do
	
	echo -e "Checking for" $line 
	NAME=$(echo $line | awk -F "/" '{print $NF}')

	if [ -f "$line" ]; then
		echo -e "${RED}[-] POSSIBLE KEYDNAMP MALWARE SPREADED BY TRANSMISSION FOUND in $NAME ${NOCOLOR}"
		FLAG='1'
		read -p 'Do you want to remove it? [Y/n]  ' yn
		case $yn in
			[Yy]* ) rm  $line && echo -e "${GREEN}$NAME ${NOCOLOR}Deleted";;
			[Nn]* ) echo -e "${RED}$NAME ${NOCOLOR}Not deleted!" ;;
			* ) echo "Invalid Option" ;;
		esac
		echo ""
	else
		echo -e "${GREEN}[+] $NAME NOT FOUND\n ${NOCOLOR}"
	fi
done

if [ "$FLAG" = "1" ]; then
	echo -ne "\nPlease remove possible Keydnap malware and run the program again\n\n"
elif [ "$FLAG" = "0" ]; then
	echo -ne "\nNo Keydnap malware found in your system\n\n"

fi
