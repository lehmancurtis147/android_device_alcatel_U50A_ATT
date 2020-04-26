# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#LOCAL_PATH := device/alcatel/U50A_ATT
#
# This file is the build configuration for a full Android
# build for grouper hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# must be before including omni part
$(call inherit-product, build/target/product/embedded.mk)

TARGET_BOOTANIMATION_SIZE := 854x480
AB_OTA_UPDATER            := false

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from hardware-specific part of the product configuration

# Discard inherited values and use our own instead.
PRODUCT_DEVICE       := U50A_ATT
PRODUCT_NAME         := omni_U50A_ATT
PRODUCT_BRAND        := TCL
PRODUCT_MODEL        := 5041C
PRODUCT_MANUFACTURER := Alcatel
PRODUCT_LOCALES      := en_US,fr_CA,es_MX,zh_CN,zh_TW

# ADB Fix
PRODUCT_PROPERTY_OVERRIDES += 'sys.usb.ffs.aio_compat=true' \
    ro.vendor.build.security_patch=2099-12-31