#!/bin/bash

# EA to show McAfee version

avpath="/Applications/McAfee Endpoint Security for Mac.app"

if [ -d "$avpath" ];
then
	version=$( /usr/bin/defaults read "${avpath}/Contents/Info" CFBundleShortVersionString )
	echo "<result>$version</result>"
else
	echo "<result>Not Installed</result>"
fi
