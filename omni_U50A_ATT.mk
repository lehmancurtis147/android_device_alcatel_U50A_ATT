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

DEVICE_PATH := device/alcatel/U50A_ATT

# Release name
PRODUCT_RELEASE_NAME := U50A_ATT

# must be before including omni part
$(call inherit-product, build/target/product/embedded.mk)

TARGET_BOOTANIMATION_SIZE := 789x480

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from hardware-specific part of the product configuration

# Discard inherited values and use our own instead.
PRODUCT_BRAND        := TCL
PRODUCT_MODEL        := 5041C
PRODUCT_MANUFACTURER := Alcatel
PRODUCT_DEVICE       := U50A_ATT
PRODUCT_NAME         := omni_U50A_ATT
PRODUCT_LOCALES      := en_US,fr_CA,es_MX,zh_CN,zh_TW

# INITS
PRODUCT_COPY_FILES   += \
    $(DEVICE_PATH)/recovery/root/ueventd.rc:/recovery/root/ueventd.rc \
    $(DEVICE_PATH)/recovery/root/init.recovery.usb.rc:/recovery/root/init.recovery.usb.rc \
    $(DEVICE_PATH)/recovery/root/init.recovery.mt6739.rc:/recovery/root/init.recovery.mt6739.rc

# Files for recovery/etc
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery/root/etc/twrp.flags:/recovery/root/etc/twrp.flags \
    $(DEVICE_PATH)/recovery/root/etc/mke2fs.conf:/recovery/root/etc/mke2fs.conf \
    ${DEVICE_PATH}/recovery/root/etc/init/mtpd.rc:/recovery/root/etc/init/mtpd.rc \
    $(DEVICE_PATH)/recovery/root/etc/recovery.fstab:/recovery/root/etc/recovery.fstab


# Files for recovery/lib
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery/root/lib/libmtp.so:/recovery/root/lib/libmtp.so \
    $(DEVICE_PATH)/recovery/root/lib/libusbhost.so:/recovery/root/lib/libusbhost.so \
    $(DEVICE_PATH)/recovery/root/lib/modules/fpsgo.ko:/recovery/root/lib/modules/fpsgo.ko

# Files for recovery/res
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery/root/res/keys:/recovery/root/res/keys

LOCAL_SHARED_LIBRARIES += \
    libz \
    libc \
    libdl \
    libutils \
    libcutils \
    libstdc++ \
    libusbhost \
    libstlport \
    libaosprecovery

# MTP
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.secure=0 \
    ro.adb.secure=0 \
    ro.debuggable=1 \
    sys.usb.vid=0x1bbb\
    sys.usb.pid=0x0167\
    sys.usb.acm_cnt=0 \
    sys.usb.configfs=1 \
    sys.usb.ffs.ready=1 \
    sys.usb.config=mtp,adb \
    security.perf_harden=0 \
    sys.usb.ffs.mtp.ready=1 \
    sys.usb.controller=musb-hdrc \
    persist.sys.usb.config=mtp,adb

# Packages
PRODUCT_PACKAGES += \
    svc \
    ffs \
    adbd \
    mtpd \
    snap \
    torch \
    libmtp \
    usb_mtp \
    twrpmtp \
    configfs \
    libem_usb_jni \
    libtwrpmtp-ffs \
    com.android.future.usb.accessory

# VOLD
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    vold.has_quota=1 \
    vold.has_reserved=0 \
    vold.has_adoptable=1 \
    vold.post_fs_data_done=1

# ADB Fix
PRODUCT_PROPERTY_OVERRIDES += \
    sys.usb.ffs.aio_compat=true \
    ro.vendor.build.security_patch=2099-12-31