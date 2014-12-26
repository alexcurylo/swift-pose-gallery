#!/bin/sh

#
# script_build_begin.sh
# PoseGallery
#
# Copyright (c) 2015 Trollwerks Inc. All rights reserved.
#

# Version update by svnversion + 1 -- no, use git thingy

updateBundleVersion()
{
version=`/usr/bin/svnversion -nc ${PROJECT_DIR} | /usr/bin/sed -e 's/^[^:]*://;s/[A-Za-z]//'`
buildNumber=`expr $version + 1`
plist="${SRCROOT}/PosesPro2/resources/posespro/PosesPro2-Info.plist"
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $buildNumber" $plist
echo Build version set to next checkin: $buildNumber
}

# Build Date update

updateBuildDate()
{
CFBuildDate=$(date +"%a %b %d %H:%M:%S %Z %Y")
plist="${SRCROOT}/PosesPro2/resources/posespro/PosesPro2-Info.plist"
/usr/libexec/PlistBuddy -c "Set :CFBuildDate $CFBuildDate" $plist
echo Build date set to current date: $CFBuildDate
}

# enable for one build just before each checkin
# otherwise you will conflict with other people's updates

#updateBundleVersion;
#updateBuildDate

# finished

return 0
