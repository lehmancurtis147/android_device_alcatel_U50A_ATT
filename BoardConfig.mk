########################################################################
#                                                                      #
#                        BoardConfig.mk For Tetra                      #
#                           by:lehmancurtis147                         #
#                                                                      #
########################################################################
#                                                                      #
# Copyright (C) APRIL 24, 2020 Curtis Lehman                           #
#                                                                      #
# This program is free software; you can redistribute it and/or modify #
# it under the terms of the GNU General Public License version 2 as    #
# published by the Free Software Foundation.                           #
#                                                                      #
# This program is distributed in the hope that it will be useful,      #
# but WITHOUT ANY WARRANTY; without even the implied warranty of       #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.                 #
# See http://www.gnu.org/licenses/gpl-2.0.html for more details        #
#                                                                      #
########################################################################

DEVICE_PATH   := device/alcatel/U50A_ATT

BOARD_VENDOR := TCL

# ARCHITECTURE
TARGET_ARCH         := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI      := armeabi-v7a
TARGET_CPU_ABI2     := armeabi
TARGET_CPU_VARIANT  := cortex-a9

## PLATFORM
TARGET_BOARD_PLATFORM     := mt6739
TARGET_BOARD_PLATFORM_GPU := PowerVR GE8100

## BOOTLOADER
TARGET_BOOTLOADER_BOARD_NAME := mt6739
TARGET_NO_BOOTLOADER         := true

## CRYPTO
TW_INCLUDE_CRYPTO     := true
TW_CRYPTO_FS_TYPE     := "f2fs"
TW_CRYPTO_REAL_BLKDEV := "/dev/block/dm-2"
TW_CRYPTO_MNT_POINT   := "/data"
TW_CRYPTO_FS_OPTIONS  := "rw,lazytime,seclabel,nosuid,nodev,noatime,background_gc=on,discard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,extent_cache,mode=adaptive,active_logs=6 0 0"

## AVB
BOARD_AVB_ENABLE := false

## NEON
ARCH_ARM_HAVE_NEON := true

## KERNEL
TARGET_USES_PREBUILT_KERNEL := true
TARGET_PREBUILT_KERNEL      := $(DEVICE_PATH)/prebuilt/kernel

## KERNEL CONFIGURATION
BOARD_HASH_TYPE          := sha1
BOARD_KERNEL_IMAGE_NAME  := kernel
BOARD_KERNEL_PAGESIZE    := 2048
BOARD_KERNEL_BASE        := 0x40000000
BOARD_KERNEL_OFFSET      := 0x00008000
BOARD_RAMDISK_OFFSET     := 0x05000000
BOARD_SECOND_OFFSET      := 0x00f00000
BOARD_KERNEL_TAGS_OFFSET := 0x04000000
BOARD_KERNEL_CMDLINE     := 'bootopt=64S3,32S1,32S1 buildvariant=eng androidboot.selinux=permissive'

## MKBOOT ARGUEMENTS
BOARD_MKBOOTIMG_ARGS := \
    --cmdline $(BOARD_KERNEL_CMDLINE) \
    --ramdisk_offset $(BOARD_RAMDISK_OFFSET) \
    --tags_offset $(BOARD_KERNEL_TAGS_OFFSET) \
    --kernel_offset $(BOARD_KERNEL_OFFSET) \
    --second_offset $(BOARD_SECOND_OFFSET) \
    --base $(BOARD_KERNEL_BASE) \
    --pagesize $(BOARD_KERNEL_PAGESIZE) \
    --board "R8MAH0H0CT00"

## PARTITION SIZES
BOARD_BOOTIMAGE_PARTITION_SIZE     := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 24641536
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 3397386240
BOARD_USERDATAIMAGE_PARTITION_SIZE := 3221225472
BOARD_CACHEIMAGE_PARTITION_SIZE    := 335544320

## PAGE SIZE * 64
BOARD_FLASH_BLOCK_SIZE := 131072

## FS-Types
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE   := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE    := ext4

## FILESYSTEMS
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USES_MKE2FS         := true

## MISC FS VARIABLES
BOARD_HAS_NO_MISC_PARTITION := false
BOARD_HAS_NO_REAL_SDCARD    := true
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_SUPPRESS_EMMC_WIPE    := true
BOARD_USES_MMCUTILS         := true

## MTK Hardware
BOARD_HAS_MTK_HARDWARE                 := true
BOARD_USES_MTK_HARDWARE                := true
BOARD_CHARGER_ENABLE_SUSPEND           := true
BOARD_CHARGER_SHOW_PERCENTAGE          := true
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

## DISPLAY PROPERTIES
USE_OPENGL_RENDERER                   := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
TARGET_SCREEN_WIDTH                   := 480
TARGET_SCREEN_HEIGHT                  := 854
RECOVERY_GRAPHICS_USE_LINELENGTH      := true

## RECOVERY DETAILS
TARGET_RECOVERY_FSTAB        := $(DEVICE_PATH)/recovery/root/etc/recovery.fstab
TARGET_RECOVERY_INIT_RC      := $(DEVICE_PATH)/recovery/root/init.rc
TARGET_USES_RECOVERY_AS_BOOT := false
TARGET_PROVIDES_KEYMASTER    := true
TARGET_NO_RECOVERY           := false
RECOVERY_SDCARD_ON_DATA      := true

## TEAM WIN RECOVERY PROJECT PROPERTIES
TW_THEME                 := portrait_hdpi
TW_DEVICE_VERSION        := 'of-1.01'
TW_INPUT_BLACKLIST       := "hbtp_vm"
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_EXCLUDE_MTP           := false
TW_HAS_MTP               := true
TW_REBOOT_BOOTLOADER     := true
TW_REBOOT_RECOVERY       := true
TW_USE_TOOLBOX           := true
TW_NEW_ION_HEAP          := true
TW_INCLUDE_REPACKTOOLS   := true
TW_DEFAULT_LANGUAGE      := en-US
TWRP_INCLUDE_LOGCAT      := true

## ID
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true

## Orange Fox
FOX_RECOVERY_INSTALL_PARTITION     := "/dev/block/platform/bootdevice/by-name/recovery"

## Extras
ANDROID_BUILD_EMBEDDED             := true

## Promo
OF_MAINTAINER                      := ( lehmancurtis147 )