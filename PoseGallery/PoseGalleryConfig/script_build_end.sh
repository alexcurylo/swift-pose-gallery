#!/bin/sh

#
# script_end_begin.sh
#
# Copyright (c) 2014 Trollwerks Inc. All rights reserved.
#

# Crashlytics magic 

./Fabric.framework/run 186ef2a41f30e2ce39a21f35b61600d3ae927290 3ce3168d4276f7278273f34fbc45d96dd492c71a98dc7a3dcd8f1fc3da321e50

# reveal the binary in the Finder if you like

echo Built at ${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}
#/usr/bin/open --reveal "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"

# finished

return 0


# Under the build phases section in your target, add a new run script and add the following:
#
# find -L ${SRCROOT}// -type f -not -name “.*” -not -name “`basename ${INFOPLIST_FILE}`” | xargs -t -I {} cp {} ${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/;
#
# this will add all your images in the folder reference into the actual .app build of your project. cheers