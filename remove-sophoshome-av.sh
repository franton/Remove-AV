#!/bin/bash

# Slightly unsophisticated script to remove all specified Sophos Home AV files and folders
# Author  : richard at richard - purves dot com
# Version : 1.0 - Initial Version
# Version : 1.1 - Now unloads launchd plists at the suggestion of Tom Bridge

# Start by setting up the array with all the running launchagents/daemons running

launchd=( $(launchctl list | grep com.sophos | awk '{print $3}' ) )

# Now recursively unload all these

# Calculate the length of the launchd array.
tLen=${#launchd[@]}

# Loop around the array and delete the files/folders.

for (( i=0; i<${tLen}; i++ ));
do
  echo "Now unloading "${launchd[$i]}
  launchctl disable ${launchd[$i]}
done

# Now set up the array variable to hold all the files and folders we're going to delete

delete[0]="/Applications/Sophos Home.app"
delete[1]="/Applications/Remove Sophos Home.app"
delete[2]="/Library/Application Support/Sophos"
delete[3]="/Library/Extensions/Sophos*"
delete[4]="/Library/Frameworks/Sophos*"
delete[5]="/Library/LaunchAgents/com.sophos*"
delete[6]="/Library/LaunchDaemons/com.sophos*"
delete[7]="/Library/Preferences/com.sophos*"
delete[8]="/Library/Sophos Anti-Virus"

# Let's do the deleting!

# Calculate the length of the delete array.
tLen=${#delete[@]}

# Loop around the array and delete the files/folders.

for (( i=0; i<${tLen}; i++ ));
do
  echo "Now deleting "${delete[$i]}
  rm -rf ${delete[$i]}
done

exit 0