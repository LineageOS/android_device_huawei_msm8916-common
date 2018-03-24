#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FORCE_32_BIT := true

include device/cyanogen/msm8916-common/BoardConfigCommon.mk

VENDOR_PATH := device/huawei/msm8916-common

# Audio
USE_XML_AUDIO_POLICY_CONF := 1

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(VENDOR_PATH)/bluetooth

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
BOARD_USES_LEGACY_MMAP := true
TARGET_USE_VENDOR_CAMERA_EXT := true
BOARD_GLOBAL_CFLAGS += -DCAMERA_VENDOR_L_COMPAT

# Charger
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BOARD_CHARGER_ENABLE_SUSPEND := true

# Lineage Hardware
BOARD_HARDWARE_CLASS += \
    $(VENDOR_PATH)/lineagehw

# Flags
BOARD_NO_SECURE_DISCARD := true

# GPS
TARGET_NO_RPC := true
USE_DEVICE_SPECIFIC_GPS := true

# Graphics
TARGET_USE_COMPAT_GRALLOC_ALIGN := true

# Init
TARGET_LIBINIT_MSM8916_DEFINES_FILE := $(VENDOR_PATH)/init/init_cherry.cpp

# Kernel
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_DTBTOOL_ARGS := -2
BOARD_KERNEL_IMAGE_NAME := zImage
BOARD_KERNEL_SEPARATED_DT := true
TARGET_KERNEL_SOURCE := kernel/huawei/msm8916
TARGET_KERNEL_CONFIG := lineageos_cherry_defconfig

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Partitions
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x01400000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x01800000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x70000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 4513037824 # 4513054208-16384
BOARD_CACHEIMAGE_PARTITION_SIZE := 0x10000000
BOARD_PERSISTIMAGE_PARTITION_SIZE := 0x02000000
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

# Power
TARGET_TAP_TO_WAKE_NODE := "/sys/touch_screen/easy_wakeup_gesture"

# Properties
TARGET_SYSTEM_PROP += $(VENDOR_PATH)/system.prop

# Recovery
TARGET_RECOVERY_DEVICE_DIRS += $(VENDOR_PATH)
#RECOVERY_VARIANT := twrp
ifneq ($(RECOVERY_VARIANT),twrp)
TARGET_RECOVERY_FSTAB := $(VENDOR_PATH)/recovery/recovery.fstab
else
TARGET_RECOVERY_FSTAB := $(VENDOR_PATH)/recovery/twrp.fstab
RECOVERY_GRAPHICS_FORCE_USE_LINELENGTH := true
DEVICE_RESOLUTION := 720x1280
RECOVERY_SDCARD_ON_DATA := true
TW_NEW_ION_HEAP := true
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_TARGET_USES_QCOM_BSP := true
TW_EXTRA_LANGUAGES := true
TW_INPUT_BLACKLIST := "accelerometer\x0alis3dh-accel"
TARGET_RECOVERY_QCOM_RTC_FIX := true
BOARD_SUPPRESS_SECURE_ERASE := true
endif

# RIL
BOARD_GLOBAL_CFLAGS += -DUSE_RIL_VERSION_11

# SELinux
#BOARD_SEPOLICY_DIRS += \
    $(VENDOR_PATH)/sepolicy

# Sensors
USE_SENSOR_MULTI_HAL := true

# Shims
TARGET_LD_SHIM_LIBS += \
    /system/lib/libcutils.so|libshim_cutils.so \
    /vendor/bin/mm-qcamera-daemon|libqcamerasvr-c++.so

# Wifi
TARGET_PROVIDES_WCNSS_QMI := true

# inherit from the proprietary version
include vendor/huawei/msm8916-common/BoardConfigVendor.mk
