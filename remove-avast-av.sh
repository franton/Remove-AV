#!/bin/bash

# Slightly unsophisticated script to remove all specified Avast! AV files and folders
# Author  : richard at richard - purves dot com
# Version : 1.0 - Initial Version
# Version : 1.1 - Now unloads launchd plists at the suggestion of Tom Bridge
# Version : 1.2 - Now forgets installer pkgs at the suggestion of Francois Leveaux-Tiffreau

# Start by setting up the array with all the running launchagents/daemons running

launchd=( $(launchctl list | grep com.avast | awk '{print $3}' ) )

# Now recursively unload all these

# Calculate the length of the launchd array.

tLen=${#launchd[@]}

# Loop around the array and delete the files/folders.

for (( i=0; i<${tLen}; i++ ));
do
  echo "Now unloading "${launchd[$i]}
  launchctl disable ${launchd[$i]}
done

# Setting up the array variable to hold all the files and folders we're going to delete

delete[0]="/Applications/Avast Mac Security.app"
delete[1]="/Applications/Avast SecureLine VPN.app"
delete[2]="/Library/Application Support/Avast"
delete[3]="/Library/Application Support/Avast SecureLine"
delete[4]="/Library/LaunchAgents/com.avast.*"
delete[5]="/Library/LaunchDaemons/com.avast.*"

# Let's do the deleting!

# Calculate the length of the delete array.

tLen=${#delete[@]}

# Loop around the array and delete the files/folders.

for (( i=0; i<${tLen}; i++ ));
do
  echo "Now deleting "${delete[$i]}
  rm -rf ${delete[$i]}
done

# Now we have to deal with the user level stuff this leaves behind

ls /Users/ | while read USERS ;
do  
	if [ -d /Users/$USERS/Library/Preferences/ ];
	then
		rm -rf "/Users/$USERS/Library/Application Support/Avast"
		rm -rf "/Users/$USERS/Library/LaunchAgents/Avast"
	fi
done

# Finally get the mac to forget that it ever installed this product

# Get all the pkg receipts left on the system

receipts=( $( pkgutil --pkgs | grep avast ) )

# Calculate the length of the receipt array.

tLen=${#receipts[@]}

# Loop around the array and remove the receipts.

for (( i=0; i<${tLen}; i++ ));
do
  echo "Now removing receipt "${receipts[$i]}
  pkgutil --forget ${receipts[$i]}
done

exit 0