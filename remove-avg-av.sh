#!/bin/bash

# Very unsophisticated script to remove all specified AVG AV files and folders
# Author  : richard at richard - purves dot com
# Version : 1.0 - Initial Version

# Start by setting up the array variable to hold all the files and folders we're going to delete

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

exit 0
