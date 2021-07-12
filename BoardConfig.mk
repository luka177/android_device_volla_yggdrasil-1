#
# Copyright (C) 2017-2019 The LineageOS Project
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
#

# Inherit from mt6763-common
-include device/volla/mt6763-common/BoardConfigCommon.mk

BOARD_VENDOR := volla

DEVICE_PATH := device/volla/yggdrasil

# Kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_KERNEL_CMDLINE += loop.max_part=7
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_HASH_TYPE := sha1
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_DTB_OFFSET := 0x13f88000
BOARD_RAMDISK_OFFSET := 0x14f88000
BOARD_SECOND_OFFSET := 0x00e88000
BOARD_KERNEL_TAGS_OFFSET := 0x13f88000
BOARD_BOOT_HEADER_VERSION := 2
BOARD_CUSTOM_BOOTIMG := true
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_SOURCE := kernel/volla/mt6763
TARGET_KERNEL_CONFIG := yggdrasil_defconfig
TARGET_KERNEL_ADDITIONAL_FLAGS := \
    DTC=$(shell pwd)/prebuilts/misc/$(HOST_OS)-x86/dtc/dtc \
    MKDTIMG=$(shell pwd)/prebuilts/misc/$(HOST_OS)-x86/libufdt/mkdtimg

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072                   # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432         #    32768 * 1024 mmcblk0p26
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432     #    32768 * 1024 mmcblk0p2
BOARD_CACHEIMAGE_PARTITION_SIZE := 452984832       #  442368 * 1024 mmcblk0p32
BOARD_DTBOIMG_PARTITION_SIZE := 8388608            #     8192 * 1024 mmcblk0p27
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3758096384     #  3670016 * 1024 mmcblk0p31
BOARD_VENDORIMAGE_PARTITION_SIZE := 838860800      #   819200 * 1024 mmcblk0p30
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Security patch level
VENDOR_SECURITY_PATCH := 2020-11-05

# Inherit from the proprietary version
-include vendor/volla/yggdrasil/BoardConfigVendor.mk
