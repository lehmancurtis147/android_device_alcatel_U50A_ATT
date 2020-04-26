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
#
## TWRP ##
#
export ALLOW_MISSING_DEPENDENCIES="true"
export LC_ALL="C"
## Start
#
. build/envsetup.sh
## Lunch device
#
lunch omni_U50A_ATT-eng
## Build TWRO
#
make clean; mka recoveryimage
