#!/bin/bash

# EA to show Sophos Home version

avpath="/Applications/Sophos Home.app"

if [ -d "$avpath" ];
then
	version=$( /usr/bin/defaults read "${pluginpath}/Contents/Info" CFBundleShortVersionString )
	echo "<result>$version</result>"
else
	echo "<result>Not Installed</result>"
fi