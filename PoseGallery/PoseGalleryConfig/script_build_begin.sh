#!/bin/sh

#
# script_build_begin.sh
# PoseGallery
#
# Copyright (c) 2015 Trollwerks Inc. All rights reserved.
#

# icon tagging

if [ $CONFIGURATION != "Release" ] ; then
${SRCROOT}/PoseGalleryConfig/script_tag_icon.sh tag PoseGallery/resources/Images.xcassets/AppIcon.appiconset
fi

# finished

return 0
