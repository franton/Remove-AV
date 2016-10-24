#!/bin/bash

# EA to show Avast version

avpath="/Applications/Avast.app"

if [ -d "$avpath" ];
then
	version=$( /usr/bin/defaults read "${pluginpath}/Contents/Info" CFBundleShortVersionString )
	echo "<result>$version</result>"
else
	echo "<result>Not Installed</result>"
fi