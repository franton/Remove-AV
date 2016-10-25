#!/bin/bash

# Very unsophisticated script to remove all specified Avira AV files and folders
# Author  : richard at richard - purves dot com
# Version : 1.0 - Initial Version

# Start by setting up the array variable to hold all the files and folders we're going to delete

delete[0]="/Applications/Avira.app"
delete[1]="/Applications/Utilities/Avira-Uninstall.app"
delete[2]="/Library/Application Support/Avira"
delete[3]="/Library/LaunchAgents/com.avira*"
delete[4]="/Library/LaunchDaemons/com.avira*"

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
		rm -rf "/Users/$USERS/Application Support/Avira"
	fi
done

exit 0