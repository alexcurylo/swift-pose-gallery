#!/bin/sh

#
# script_build_end.sh
# PoseGallery
#
# Copyright © 2016 Trollwerks Inc. All rights reserved.
#

plist="${CONFIGURATION_BUILD_DIR}/${INFOPLIST_PATH}"

# http://blog.jaredsinclair.com/post/97193356620/the-best-of-all-possible-xcode-automated-build

update_bundle_version()
{
git=`sh /etc/profile; which git`
build=`"$git" rev-list --all |wc -l`
if [[ $CONFIGURATION == *Debug* ]]; then
branch=`"$git" rev-parse --abbrev-ref HEAD`
version=$build-$branch
else
version=$build
fi
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $version" "${plist}"
echo Build version set to git specs: $version
}

# displayed in settings

update_build_date()
{
CFBuildDate=$(date +"%y.%m.%d %H:%M:%S %Z")
/usr/libexec/PlistBuddy -c "Set :CFBuildDate $CFBuildDate" "${plist}"
echo Build date set to current date: $CFBuildDate
}

# see script_tag_icon.sh

restore_icon()
{
if [ $CONFIGURATION != "Release" ] ; then
${SRCROOT}/PoseGalleryConfig/script_tag_icon.sh cleanup PoseGallery/resources/Images.xcassets/AppIcon.appiconset
fi
}

# http://vocaro.com/trevor/blog/2012/10/21/xcode-groups-vs-folder-references/

copy_branding()
{
# this will add all your images in the folder reference into the actual .app build of your project. cheers
find -L ${SRCROOT}// -type f -not -name “.*” -not -name “`basename ${INFOPLIST_FILE}`” | xargs -t -I {} cp {} ${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/;
}

# set build-specific info

echo Setting info in plist $plist:
update_bundle_version
update_build_date
restore_icon
#copy_branding

# Fabric magic
# Scripts for automating Beta distribution: https://dev.twitter.com/crashlytics/beta-distribution/ios

#if [ $CONFIGURATION != "Debug" ] ; then
    echo Uploading to Crashlytics:
    ./PoseGallery/libraries/Fabric.framework/run 186ef2a41f30e2ce39a21f35b61600d3ae927290 3ce3168d4276f7278273f34fbc45d96dd492c71a98dc7a3dcd8f1fc3da321e50
#fi

# reveal the binary in the Finder if you like

echo Built at ${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}
#/usr/bin/open --reveal "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"

# finished

return 0
