#!/bin/bash

# Slightly unsophisticated script to remove all specified AVG AV files and folders
# Author  : richard at richard - purves dot com
# Version : 1.0 - Initial Version
# Version : 1.1 - Now unloads launchd plists at the suggestion of Tom Bridge
# Version : 1.2 - Now forgets installer pkgs at the suggestion of Francois Leveaux-Tiffreau

# Start by setting up the array with all the running launchagents/daemons running

launchd=( $(launchctl list | grep com.avg | awk '{print $3}' ) )

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

delete[0]="/Applications/AVG AntiVirus.app"
delete[1]="/Library/LaunchAgents/com.avg.*"
delete[2]="/Library/LaunchDaemons/com.avg.*"
delete[3]="/Library/Logs/com.avg.Antivirus"

# Let's do the deleting!

# Calculate the length of the delete array.

tLen=${#delete[@]}

# Loop around the array and delete the files/folders.

for (( i=0; i<${tLen}; i++ ));
do
  echo "Now deleting "${delete[$i]}
  rm -rf ${delete[$i]}
done

# Finally get the mac to forget that it ever installed this product

pkgutil --pkgs | grep avg | xargs pkgutil --forget

exit 0