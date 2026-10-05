#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from X6882 device
$(call inherit-product, device/infinix/X6882/device.mk)

BOARD_VENDOR := Infinix
PRODUCT_NAME := lineage_X6882
PRODUCT_DEVICE := X6882
PRODUCT_MANUFACTURER := INFINIX
PRODUCT_BRAND := Infinix
PRODUCT_MODEL := Infinix X6882

PRODUCT_GMS_CLIENTID_BASE := android-transsion
PRODUCT_SYSTEM_NAME := X6882-OP
PRODUCT_SYSTEM_DEVICE := X6882

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="sys_tssi_64_armv82_infinix-user 14 UP1A.231005.007 980236 release-keys" \
    BuildFingerprint=Infinix/X6882-OP/Infinix-X6882:14/UP1A.231005.007/260117V1572:user/release-keys \
    DeviceName=$(PRODUCT_SYSTEM_DEVICE) \
    DeviceProduct=$(PRODUCT_SYSTEM_NAME)

# Time
LINEAGE_VERSION_APPEND_TIME_OF_DAY := true

# Axion Device Configuration
AXION_MAINTAINER := gutssnv
TARGET_DISABLE_EPPE := true
TARGET_ENABLE_BLUR := true

# Cpu Configuration
PERF_GOV_SUPPORTED := true
PERF_DEFAULT_GOV := reflex
PERF_ANIM_OVERRIDE := true

BYPASS_CHARGE_SUPPORTED ?= false

# Processor name
AXION_PROCESSOR := Mediatek_Helio_G100

# Camera information
AXION_CAMERA_REAR_INFO := 50
AXION_CAMERA_FRONT_INFO := 8

