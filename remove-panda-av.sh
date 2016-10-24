#!/bin/bash

# Very unsophisticated script to remove all specified Panda AV files and folders
# Author  : richard at richard - purves dot com
# Version : 1.0 - Initial Version

# Start by setting up the array variable to hold all the files and folders we're going to delete

delete[0]="/Applications/Intego/*"
delete[1]="/Applications/VirusBarrier.app"
delete[2]="/Library/Frameworks/IntegoiCalFramework.framework"
delete[3]="/Library/LaunchAgents/com.intego.*"
delete[4]="/Library/LaunchDaemons/com.intego.*"
delete[5]="/Library/Intego"
delete[6]="/Library/Preferences/Intego"

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
