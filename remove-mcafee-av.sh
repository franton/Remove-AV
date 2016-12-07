#!/bin/bash

# Moderately unsophisticated script to remove all specified McAfee EPM AV files and folders
# Author  : fti at me dot com
# Version : 1.0 - Initial Version
# Version : 1.2 - Now forgets installer pkgs.

# Start by setting up the array with all the running launchagents/daemons running

launchd=( $(launchctl list | grep -E 'com.mcafee' | awk '{print $3}' ) )

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

delete[0]="/Library/LaunchDaemons/com.mcafee*"
delete[1]="/etc/init.d/dx"
delete[2]="/etc/ma.d/DXL_____1000"                                
delete[3]="/opt/McAfee"                                           
delete[4]="/var/McAfee"
delete[5]="/Applications/McAfee\ Endpoint\ Security\ for\ Mac.app"
delete[6]="/Library/Documentation/Help/McAfeeSecurity_CommonPolicy.help"
delete[7]="/Library/LaunchAgents/com.mcafee.*.plist"
delete[8]="/usr/local/McAfee"
delete[9]="/private/etc/cma.d"
delete[10]="/Library/Application\ Support/McAfee"
delete[11]="/Library/Preferences/com.mcafee.*.plist"

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

# Get all the pkg receipts left on the system

receipts=$( $( pkgutil --pkgs | grep mcafee ) )

# Calculate the length of the receipt array.

tLen=${#receipts[@]}

# Loop around the array and remove the receipts.

for (( i=0; i<${tLen}; i++ ));
do
  echo "Now removing receipt "${receipt[$i]}
  pkgutil --forget ${receipt[$i]}
done

exit 0
