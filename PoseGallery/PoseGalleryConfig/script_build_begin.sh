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

# undone work warnings

TAGS="TODO:|FIXME:"
echo "searching ${SRCROOT} for ${TAGS}"
find "${SRCROOT}" \( -name "*.swift" \) -print0 | xargs -0 egrep --with-filename --line-number --only-matching "($TAGS).*\$" | perl -p -e "s/($TAGS)/ warning: \$1/"

# finished

return 0
