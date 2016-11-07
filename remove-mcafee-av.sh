#!/bin/bash

# Moderately unsophisticated script to remove all specified SEP AV files and folders
# Pulled apart from the original Symantec uninstall script
# Author  : fti at me dot com
# Version : 1.0 - Initial Version

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

delete[0]="/Library/LaunchDaemons/com.mcafee.dxl.plist"                       
delete[1]="/etc/init.d/dx"                                                    
delete[2]="/etc/ma.d/DXL_____1000/config.xml"                                 
delete[3]="/etc/ma.d/DXL_____1000/"                                           
delete[4]="/opt/McAfee/"                                                      
delete[5]="/var/McAfee/"                                                      
delete[6]="/Applications/McAfee Endpoint Security for Mac.app"                
delete[7]="/Library/Application Support/McAfee"                               
delete[8]="/Library/Documentation/Help/McAfeeSecurity_CommonPolicy.help"      
delete[9]="/Library/LaunchAgents/com.mcafee.menulet.plist"                    
delete[10]="/Library/LaunchAgents/com.mcafee.reporter.plist"                  
delete[11]="/usr/local/McAfee/"                                               
delete[12]="/usr/local/McAfee/"                                               
delete[13]="/Library/LaunchDaemons/com.mcafee.virusscan.fmpd.plist"           
delete[14]="/private/etc/cma.d/ENDP_GS_1000MACX/config.xml"                   
delete[15]="/private/etc/cma.d/ENDP_GS_1000MACX/"                             
delete[16]="/usr/local/McAfee"                                                
delete[17]="/Library/Application\ Support/McAfee"                             
delete[18]="/Library/Preferences/com.mcafee.ssm.mcp.plist"                    
delete[19]="/private/etc/cma.d/MCPAGENT2000MACX/config.xml"                   
delete[20]="/private/etc/cma.d/MCPAGENT2000MACX"                              
delete[21]="/usr/local/McAfee"            

# Let's do the deleting!

# Calculate the length of the delete array.
tLen=${#delete[@]}

# Loop around the array and delete the files/folders.

for (( i=0; i<${tLen}; i++ ));
do
  echo "Now deleting "${delete[$i]}
  rm -rf ${delete[$i]}
done


# Remove package receipts

receipt[0]="com.mcafee.dxl"
receipt[1]="com.mcafee.mscui"
receipt[2]="com.mcafee.ssm.fmp"
receipt[3]="com.mcafee.ssm.mcp"

# Calculate the length of the receipt array.
tLen=${#receipt[@]}

# Loop around the array and delete the files/folders.

for (( i=0; i<${tLen}; i++ ));
do
  echo "Now removing receipt "${receipt[$i]}
  pkgutil --forget ${receipt[$i]}
done

exit 0