#!/bin/bash

# Very unsophisticated script to remove all specified Avast! AV files and folders
# Author  : richard at richard - purves dot com
# Version : 1.0 - Initial Version

# Start by setting up the array variable to hold all the files and folders we're going to delete

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

exit 0