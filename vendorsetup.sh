#!/use/bin/env bash

TARGET_DEVICE="US0A_ATT"
export TARGET_DEVICE="US0A_ATT"
add_lunch_combo omni_U50A_ATT-userdebug
add_lunch_combo omni_U50A_ATT-eng


export LC_ALL="C" \
    ARCH="arm" \
    ALLOW_MISSING_DEPENDENCIES="true" \
    BUILD_TYPE="Official" \
    TARGET_DEVICE="U50A_ATT" \
    TARGET_DEVICE_ALT="U50A_ATT" \
    TW_MAINTAINER="lehmancurtis147"

if [[ "$TARGET_DEVICE" == U50A ]]; then
    export TARGET_DEVICE="US0A_ATT"
fi
