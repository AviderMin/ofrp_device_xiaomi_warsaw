#
# Copyright (C) 2025 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/warsaw

# Inherit from device.mk configuration
$(call inherit-product, $(DEVICE_PATH)/device.mk)

## Device identifier
PRODUCT_DEVICE := warsaw
PRODUCT_NAME := twrp_warsaw
PRODUCT_BRAND := Xiaomi
PRODUCT_MANUFACTURER := Xiaomi

# Theme
TW_STATUS_ICONS_ALIGN := center
TW_Y_OFFSET := 116
TW_H_OFFSET := -116
