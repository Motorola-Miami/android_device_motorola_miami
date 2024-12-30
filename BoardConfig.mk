#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from motorola sm6375-common
include device/motorola/sm6375-common/BoardConfigCommon.mk

DEVICE_PATH := device/motorola/miami

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := miami

# Display
TARGET_SCREEN_DENSITY := 420

# Fingerprint
TARGET_SURFACEFLINGER_UDFPS_LIB := //$(DEVICE_PATH):libudfps_extension.miami
SOONG_CONFIG_qtidisplay_udfps := true

# Kernel
BOARD_KERNEL_CMDLINE += androidboot.hab.product=miami
TARGET_KERNEL_SOURCE := kernel/motorola/miami
TARGET_KERNEL_CONFIG := vendor/miami_defconfig

# Kernel Modules
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load))
BOARD_VENDOR_KERNEL_MODULES_BLOCKLIST_FILE := $(DEVICE_PATH)/modules.blocklist
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load.recovery))
BOOT_KERNEL_MODULES := $(BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD)
BOARD_GENERIC_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load.recovery))
RECOVERY_KERNEL_MODULES := $(BOARD_GENERIC_RAMDISK_KERNEL_MODULES_LOAD)


# Partitions
BOARD_MOT_DP_GROUP_SIZE := 9122611200 #(BOARD_SUPER_PARTITION_SIZE - 4194304)
BOARD_SUPER_PARTITION_SIZE := 9126805504

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Security
VENDOR_SECURITY_PATCH := 2024-05-01

# Inherit from the proprietary version
include vendor/motorola/miami/BoardConfigVendor.mk
