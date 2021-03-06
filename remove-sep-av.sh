#!/bin/bash

# Moderately unsophisticated script to remove all specified SEP AV files and folders
# Pulled apart from the original Symantec uninstall script
# Author  : richard at richard - purves dot com
# Version : 1.0 - Initial Version
# Version : 1.1 - Now unloads launchd plists at the suggestion of Tom Bridge
# Version : 1.2 - Now forgets installer pkgs at the suggestion of Francois Leveaux-Tiffreau

# Start by setting up the array with all the running launchagents/daemons running

launchd=( $(launchctl list | grep -E 'com.norton|com.symantec' | awk '{print $3}' ) )

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

delete[0]="/var/tmp/symantec_error_report"
delete[1]="/.com_symantec_symfs_private"
delete[2]="/.symSchedScanLockxz"
delete[3]="/Applications/Firefox.app/Contents/MacOS/extensions/{0e10f3d7-07f6-4f12-97b9-9b27e07139a5}"
delete[4]="/Applications/Firefox.app/Contents/MacOS/extensions/{29dd9c80-9ea1-4aaf-9305-a0314aba24e3}"
delete[5]="/Applications/Firefox.app/Contents/MacOS/extensions/nortonsafetyminder@symantec.com"
delete[6]="/Applications/GatherSymantecInfo"
delete[7]="/Applications/Late Breaking News"
delete[8]="/Applications/LiveUpdate"
delete[9]="/Applications/LiveUpdate Folder"
delete[10]="/Applications/LiveUpdate Folder (OS X)"
delete[11]="/Applications/navx"
delete[12]="/Applications/Norton"
delete[13]="/Applications/Symantec AntiVirus"
delete[14]="/Applications/Symantec Cloud Security.app"
delete[15]="/Applications/Symantec Endpoint Protection.app"
delete[16]="/Applications/Symantec Endpoint Protection Cloud.app"
delete[17]="/Applications/Symantec Solutions"
delete[18]="/Applications/Symantec Unified Endpoint Protection.app"
delete[19]="/Applications/Symantec/LiveUpdate.app"
delete[20]="/Applications/Symantec/Read Me Files"
delete[21]="/Applications/Symantec" 
delete[22]="/Applications/Trash Running Daemons"
delete[23]="/Applications/uDelete Preferences"
delete[24]="/Applications/Register Your Software"
delete[25]="/etc/liveupdate.conf"
delete[26]="/etc/mach_init.d/SymSharedSettings.plist"
delete[27]="/etc/Symantec.conf"
delete[28]="/Firewall"  
delete[29]="/Library/Application Support/NAVDiagnostic.log"
delete[30]="/Library/Application Support/NAV.history"
delete[31]="/Library/Application Support/nat_"  
delete[32]="/Library/Application Support/nat_"  
delete[33]="/Library/Application Support/nav_"  
delete[34]="/Library/Application Support/nis_"  
delete[35]="/Library/Application Support/nsm_"  
delete[36]="/Library/Application Support/Norton Application Aliases"
delete[37]="/Library/Application Support/Norton Solutions Support"
delete[38]="/Library/Application Support/norton_"  
delete[39]="/Library/Application Support/o2spy.log"
delete[40]="/Library/Application Support/regid.1992-12.com.symantec" 
delete[41]="/Library/Application Support/Symantec"
delete[42]="/Library/Application Support/Symantec_IPUA"
delete[43]="/Library/Application Support/symantec_uninstalldashboard" 
delete[44]="/Library/Application Support/SymRun"
delete[45]="/Library/Authenticators/SymAuthenticator.bundle"
delete[46]="/Library/CFMSupport/Norton Shared Lib"
delete[47]="/Library/CFMSupport/Norton Shared Lib Carbon"
delete[48]="/Library/Contextual Menu Items/NAVCMPlugIn.plugin"
delete[49]="/Library/Contextual Menu Items/SAVCMPlugIn.plugin"
delete[50]="/Library/Contextual Menu Items/SymFileSecurityCM.plugin"
delete[51]="/Library/Documentation/Help/LiveUpdate Help"
delete[52]="/Library/Documentation/Help/LiveUpdate-Hilfe"
delete[53]="/Library/Documentation/Help/Norton AntiVirus Help"
delete[54]="/Library/Documentation/Help/Norton AntiVirus-Hilfe"
delete[55]="/Library/Documentation/Help/Norton Help"
delete[56]="/Library/Documentation/Help/Norton Help Scripts"
delete[57]="/Library/Documentation/Help/Norton Help Scripts Folder"
delete[58]="/Library/Documentation/Help/Norton Utilities Help"
delete[59]="/Library/Extensions/FileSecurity.kext"
delete[60]="/Library/Extensions/ndcengine.kext"
delete[61]="/Library/Extensions/NortonForMac.kext"
delete[62]="/Library/Extensions/SymAPComm.kext"
delete[63]="/Library/Extensions/SymFirewall.kext"
delete[64]="/Library/Extensions/SymInternetSecurity.kext"
delete[65]="/Library/Extensions/SymIPS.kext"
delete[66]="/Library/Extensions/SymPersonalFirewall.kext"
delete[67]="/Library/Frameworks/mach_inject_bundle.framework"
delete[68]="/Library/InputManagers/Norton Confidential for Safari"
delete[69]="/Library/InputManagers/Norton Safety Minder"
delete[70]="/Library/InputManagers/SymWebKitUtils"
delete[71]="/Library/Internet Plug-Ins/Norton Confidential for Safari.plugin"
delete[72]="/Library/Internet Plug-Ins/Norton Family Safety.plugin"
delete[73]="/Library/Internet Plug-Ins/Norton Safety Minder.plugin"
delete[74]="/Library/Internet Plug-Ins/NortonFamilyBF.plugin"
delete[75]="/Library/Internet Plug-Ins/NortonInternetSecurityBF.plugin"
delete[76]="/Library/Internet Plug-Ins/NortonSafetyMinderBF.plugin"
delete[77]="/Library/LaunchDaemons/com.norton*" 
delete[78]="/Library/LaunchDaemons/com.symantec*"
delete[79]="/Library/Plug-ins/DiskImages/NUMPlugin.bundle"
delete[80]="/Library/Plug-ins/DiskImages/VRPlugin.bundle"
delete[81]="/Library/Plug-ins/DiskImages"  
delete[82]="/Library/PreferencePanes/APPrefPane.prefPane"
delete[83]="/Library/PreferencePanes/FileSaver.prefPane"
delete[84]="/Library/PreferencePanes/Norton Family Safety.prefPane"
delete[85]="/Library/PreferencePanes/Norton Safety Minder.prefPane"
delete[86]="/Library/PreferencePanes/Ribbon.Norton.prefPane"
delete[87]="/Library/PreferencePanes/SymantecQuickMenu.prefPane"
delete[88]="/Library/PreferencePanes/SymAutoProtect.prefPane"
delete[89]="/Library/PrivateFrameworks/NPF.framework"
delete[90]="/Library/PrivateFrameworks/NPFCoreServices.framework"
delete[91]="/Library/PrivateFrameworks/NPFDataSource.framework"
delete[92]="/Library/PrivateFrameworks/PlausibleDatabase.framework"
delete[93]="/Library/PrivateFrameworks/SymAppKitAdditions.framework"
delete[94]="/Library/PrivateFrameworks/SymAVScan.framework"
delete[95]="/Library/PrivateFrameworks/SymBase.framework"
delete[96]="/Library/PrivateFrameworks/SymConfidential.framework"
delete[97]="/Library/PrivateFrameworks/SymDaemon.framework"
delete[98]="/Library/PrivateFrameworks/SymFirewall.framework"
delete[99]="/Library/PrivateFrameworks/SymInternetSecurity.framework"
delete[100]="/Library/PrivateFrameworks/SymIPS.framework"
delete[101]="/Library/PrivateFrameworks/SymIR.framework"
delete[102]="/Library/PrivateFrameworks/SymLicensing.framework"
delete[103]="/Library/PrivateFrameworks/SymNetworking.framework"
delete[104]="/Library/PrivateFrameworks/SymOxygen.framework"
delete[105]="/Library/PrivateFrameworks/SymPersonalFirewall.framework"
delete[106]="/Library/PrivateFrameworks/SymScheduler.framework"
delete[107]="/Library/PrivateFrameworks/SymSEP.framework"
delete[108]="/Library/PrivateFrameworks/SymSharedSettings.framework"
delete[109]="/Library/PrivateFrameworks/SymSubmission.framework"
delete[110]="/Library/PrivateFrameworks/SymSystem.framework"
delete[111]="/Library/PrivateFrameworks/SymUIAgent.framework"
delete[112]="/Library/PrivateFrameworks/SymUIAgentUI.framework"
delete[113]="/Library/PrivateFrameworks/SymWebKitUtils.framework"
delete[114]="/Library/PrivateFrameworks/SymWebKitUtils.framework"
delete[115]="/Library/PrivilegedHelperTools/com.symantec" 
delete[116]="/Library/PrivilegedHelperTools/NATRemoteLock.app"
delete[117]="/Library/ScriptingAdditions/SymWebKitUtils.osax"
delete[118]="/Library/ScriptingAdditions/SymWebKitUtilsSL.osax"
delete[119]="/Library/Services/Norton for Mac.service"
delete[120]="/Library/Services/ScanService.service"
delete[121]="/Library/Services/Symantec" 
delete[122]="/Library/Services/SymSafeWeb.service"
delete[123]="/Library/StartupItems/NortonAutoProtect"
delete[124]="/Library/StartupItems/NortonAutoProtect.kextcache"
delete[125]="/Library/StartupItems/NortonLastStart"
delete[126]="/Library/StartupItems/NortonMissedTasks"
delete[127]="/Library/StartupItems/NortonPersonalFirewall"
delete[128]="/Library/StartupItems/NortonPrivacyControl"
delete[129]="/Library/StartupItems/NUMCompatibilityCheck"
delete[130]="/Library/StartupItems/SMC"
delete[131]="/Library/StartupItems/SymAutoProtect"
delete[132]="/Library/StartupItems/SymAutoProtect.kextcache"
delete[133]="/Library/StartupItems/SymDCInit"
delete[134]="/Library/StartupItems/SymMissedTasks"
delete[135]="/Library/StartupItems/SymProtector"
delete[136]="/Library/StartupItems/SymQuickMenuOSFix"
delete[137]="/Library/StartupItems/SymWebKitUtilsOSFix"
delete[138]="/Library/StartupItems/TrackDelete"
delete[139]="/Library/StartupItems/VolumeAssist"
delete[140]="/Library/Symantec/tmp"
delete[141]="/Library/Symantec"  
delete[142]="/Library/Widgets/NAV.wdgt"
delete[143]="/Library/Widgets/Symantec Alerts.wdgt"
delete[144]="/Library/Widgets"  
delete[145]="/Norton AntiVirus Installer Log"
delete[146]="/opt/Symantec"
delete[147]="/opt"  
delete[148]="/Personal"  
delete[149]="/Solutions"  
delete[150]="/Support/Norton"  
delete[151]="/Support"  
delete[152]="/symaperr.log"
delete[153]="/symapout.log"
delete[154]="/SymAppKitAdditions.framework"
delete[155]="/SymBase.framework"
delete[156]="/SymNetworking.framework"
delete[157]="/SymSystem.framework"
delete[158]="/SystemWorks Installer Log"
delete[159]="/Users/dev/bin/smellydecode"
delete[160]="/Users/Shared/NAV Corporate"
delete[161]="/Users/Shared/NIS Corporate"
delete[162]="/Users/Shared/RemoveSymantecMacFilesRemovesThese.txt"
delete[163]="/Users/Shared/RemoveSymantecMacFilesLog.txt"
delete[164]="/Users/Shared/RemoveSymantecMacFilesRemovesThese.txt"
delete[165]="/Users/Shared/RemoveSymantecMacFilesLog.txt"
delete[166]="/Users/Shared/SymantecRemovalToolRemovesThese.txt"
delete[167]="/Users/Shared/SymantecRemovalToolLog.txt"
delete[168]="/usr/bin/nortonscanner"
delete[169]="/usr/bin/nortonsettings"
delete[170]="/usr/bin/MigrateQTF"
delete[171]="/usr/bin/navx"
delete[172]="/usr/bin/npfx"
delete[173]="/usr/bin/savx"
delete[174]="/usr/bin/scfx"
delete[175]="/usr/bin/symsched"
delete[176]="/usr/lib/libsymsea.*"
delete[177]="/usr/lib/libwpsapi.dylib"
delete[178]="/usr/local/bin/CoreLocationProviderTest"
delete[179]="/usr/local/bin/KeyGenerator"
delete[180]="/usr/local/bin/LocationProviderInterfaceTest"
delete[181]="/usr/local/bin/LocationProviderTest"
delete[182]="/usr/local/bin/MigrateQTF"
delete[183]="/usr/local/bin/navx"
delete[184]="/usr/local/bin/nortonscanner"
delete[185]="/usr/local/bin/nortonsettings"
delete[186]="/usr/local/bin/npfx"
delete[187]="/usr/local/bin/SkyhookProviderTest"
delete[188]="/usr/local/lib/libAPFeature.a"
delete[189]="/usr/local/lib/libcx_lib.so"
delete[190]="/usr/local/lib/libecomlodr.dylib"
delete[191]="/usr/local/lib/libgecko3parsers.dylib"
delete[192]="/usr/local/lib/liblux.so." 
delete[193]="/usr/local/lib/libnlucallback.dylib"
delete[194]="/usr/local/lib/libsymsea."
delete[195]="/usr/share/man/man1/NAVScanIDs.h"
delete[196]="/var/log/du.log" 
delete[197]="/var/log/dulux.log" 
delete[198]="/var/log/lut.log" 
delete[199]="/var/log/lux.log" 
delete[200]="/var/log/luxtool.log" 
delete[201]="/var/log/mexd.log" 
delete[202]="/var/log/microdef.log" 
delete[203]="/var/log/nortondns.log"
delete[204]="/var/log/Npfkernel.log.fifo"
delete[205]="/var/root/Applications/Norton Internet Security.app"
delete[206]="/var/root/Applications" 
delete[207]="/var/root/Library/Bundles/NAVIR.bundle"
delete[208]="/var/root/Library/Bundles"  
delete[209]="/var/root/Library/Contextual Menu Items/NAVCMPlugIn.plugin"
delete[210]="/var/root/Library/Contextual Menu Items"  
delete[211]="/var/tmp/com.symantec" 
delete[212]="/var/tmp/com.Symantec" 

# Let's do the deleting!

# Calculate the length of the delete array.

tLen=${#delete[@]}

# Loop around the array and delete the files/folders.

for (( i=0; i<${tLen}; i++ ));
do
  echo "Now deleting "${delete[$i]}
  rm -rf ${delete[$i]}
done

# Now we have to deal with the user level stuff this leaves behind

ls /Users/ | while read USERS ;
do  
	if [ -d /Users/$USERS/Library/Preferences/ ];
	then
		rm -rf "/Users/$USERS/Applications/LiveUpdate Folder (OS X)"
        rm -rf "/Users/$USERS/Applications/Norton AntiVirus (OS X)"
		rm -rf "/Users/$USERS/Application Support/Norton"
		rm -rf "/Users/$USERS/Library/Application Support/Symantec"
		rm -rf "/Users/$USERS/Library/Documentation/Help/Norton Privacy Control Help"
		rm -rf "/Users/$USERS/Library/Documentation/Help/Norton Personal Firewall Help"
		rm -rf "/Users/$USERS/Library/Caches/com.apple.Safari/Extensions/Norton"
		rm -rf "/Users/$USERS/Library/Caches/com.apple.Safari/Extensions/Symantec"
		rm -rf "/Users/$USERS/Library/Caches/com.norton"
		rm -rf "/Users/$USERS/Library/Caches/com.symantec"
		rm -rf "/Users/$USERS/Library/Caches/Norton"
		rm -rf "/Users/$USERS/Library/Caches/Symantec"
		rm -rf "/Users/$USERS/Library/LaunchAgents/com.symantec*"
		rm -rf "/Users/$USERS/Library/Logs/LUTool.txt"
		rm -rf "/Users/$USERS/Library/Logs/Norton"
		rm -rf "/Users/$USERS/Library/Logs/o2spy.log"
		rm -rf "/Users/$USERS/Library/Logs/Symantec"
		rm -rf "/Users/$USERS/Library/Logs/SymAPErr.log"
		rm -rf "/Users/$USERS/Library/Logs/SymAPOut.log"
		rm -rf "/Users/$USERS/Library/Logs/SymBfw_NFM.log"
		rm -rf "/Users/$USERS/Library/Logs/SymCommP"
		rm -rf "/Users/$USERS/Library/Logs/SymDebugLeaks.log"
		rm -rf "/Users/$USERS/Library/Logs/SymDeepsight"
		rm -rf "/Users/$USERS/Library/Logs/SymFWDeepSightTrie.txt"
		rm -rf "/Users/$USERS/Library/Logs/SymFWLog.log"
		rm -rf "/Users/$USERS/Library/Logs/SymFWRules.log"
		rm -rf "/Users/$USERS/Library/Logs/SymHTTPSubmissions.txt"
		rm -rf "/Users/$USERS/Library/Logs/SymInstall"
		rm -rf "/Users/$USERS/Library/Logs/SymOxygen"
		rm -rf "/Users/$USERS/Library/Logs/SymQual"
		rm -rf "/Users/$USERS/Library/Logs/SymScanServerDaemon.log"
		rm -rf "/Users/$USERS/Library/Logs/SymSharedSettingsd.log"
		rm -rf "/Users/$USERS/Library/Logs/SymUninstall"
		rm -rf "/Users/$USERS/Library/Preferences/ByHost/com.symantec*"
		rm -rf "/Users/$USERS/Library/Preferences/com.norton*"
		rm -rf "/Users/$USERS/Library/Preferences/com.symantec*"
		rm -rf "/Users/$USERS/Library/Preferences/LiveUpdate Preferences"
		rm -rf "/Users/$USERS/Library/Preferences/LU Admin Preferences"
		rm -rf "/Users/$USERS/Library/Preferences/LU Host Admin.plist"
		rm -rf "/Users/$USERS/Library/Preferences/NAV8.0.003.plist"
		rm -rf "/Users/$USERS/Library/Preferences/Network/com.symantec*"
		rm -rf "/Users/$USERS/Library/Preferences/Norton AntiVirus Prefs Folder"
		rm -rf "/Users/$USERS/Library/Preferences/Norton Application Aliases"
		rm -rf "/Users/$USERS/Library/Preferences/Norton Personal Firewall Log"
		rm -rf "/Users/$USERS/Library/Preferences/Norton Scheduler OS X.plist"
		rm -rf "/Users/$USERS/Library/Preferences/Norton Utilities Preferences"
		rm -rf "/Users/$USERS/Library/Preferences/Norton Zone"
		rm -rf "/Users/$USERS/Library/Preferences/wcid"
		rm -rf "/Users/$USERS/Library/Safari/Extensions/Norton*"
		rm -rf "/Users/$USERS/Library/Safari/Extensions/Symantec*"
		rm -rf "/Users/$USERS/Library/Saved Application State/com.symantec*"
	fi
done

# Finally get the mac to forget that it ever installed this product

# Get all the pkg receipts left on the system

receipt=$( $( pkgutil --pkgs | grep 'symantec\|norton' ) )

# Calculate the length of the receipt array.

tLen=${#receipts[@]}

# Loop around the array and remove the receipts.

for (( i=0; i<${tLen}; i++ ));
do
  echo "Now removing receipt "${receipts[$i]}
  pkgutil --forget ${receipts[$i]}
done

exit 0