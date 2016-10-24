#!/bin/bash

# EA to show Panda version

avpath="/Applications/VirusBarrier.app"

if [ -d "$avpath" ];
then
	version=$( /usr/bin/defaults read "${pluginpath}/Contents/Info" CFBundleShortVersionString )
	echo "<result>$version</result>"
else
	echo "<result>Not Installed</result>"
fi