#!/bin/bash

# EA to show Symantec Endpoint version

avpath="/Applications/Symantec Endpoint Protection.app"

if [ -d "$avpath" ];
then
	version=$( /usr/bin/defaults read "${pluginpath}/Contents/Info" CFBundleShortVersionString )
	echo "<result>$version</result>"
else
	echo "<result>Not Installed</result>"
fi