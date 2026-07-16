#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common YAAP stuff.
$(call inherit-product, vendor/yaap/config/common_full_phone.mk)

# Inherit from X6882 device
$(call inherit-product, device/infinix/X6882/device.mk)

BOARD_VENDOR := Infinix
PRODUCT_NAME := yaap_X6882
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

TARGET_BOARD_PLATFORM := mt6789
