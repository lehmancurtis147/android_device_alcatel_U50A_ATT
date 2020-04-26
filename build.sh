#!/usr/bin/env bash
#
#########################################################################
#                                                                       #
#                          build.sh For Tetra                           #
#                          by:lehmancurtis147                           #
#                                                                       #
#########################################################################
#                                                                       #
# Copyright (C) April 18, 2020 Curtis Lehman                                      #
#                                                                       #
# This program is free software; you can redistribute it and/or modify  #
# it under the terms of the GNU General Public License version 2 as     #
# published by the Free Software Foundation.                            #
#                                                                       #
# This program is distributed in the hope that it will be useful,       #
# but WITHOUT ANY WARRANTY; without even the implied warranty of        #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.                  #
# See http://www.gnu.org/licenses/gpl-2.0.html for more details         #
#                                                                       #
#########################################################################
## Orange Fox ##
#
export ARCH="arm"
export ALLOW_MISSING_DEPENDENCIES="true"
export LC_ALL="C"
##OF Specific Flags
#
OF_DISABLE_MIUI_SPECIFIC_FEATURES="1"
OF_AB_DEVICE="0"
OF_USE_MAGISKBOOT="1"
OF_USE_MAGISKBOOT_FOR_ALL_PATCHES="1"
OF_FORCE_DISABLE_DM_VERITY_FORCED_ENCRYPTION="0"
OF_NO_RELOAD_AFTER_DECRYPTION="1"
OF_NO_TREBLE_COMPATIBILITY_CHECK="1"
OF_MAINTAINER="( lehmancurtis147 )"
## Actual Device Name
#
TARGET_DEVICE_ALT="U50A_ATT"
## FOX Flags
#
FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER="1"
FOX_RECOVERY_INSTALL_PARTITION="/dev/block/platform/bootdevice/by-name/recovery"
FOX_USE_BASH_SHELL="1"
FOX_ASH_IS_BASH="0"
FOX_USE_NANO_EDITOR="1"
FOX_USE_ZIP_BINARY="1"
FOX_USE_TOYBOX="1"
FOX_REPLACE_TOOLBOX_GETPROP="1"
FOX_REMOVE_AAPT="1"
## Start
#
. build/envsetup.sh
## Lunch device
#
lunch omni_U50A_ATT-eng
## Build OrangeFoxRecovery
#
make clean; mka recoveryimage