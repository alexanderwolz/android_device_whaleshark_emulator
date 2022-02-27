# Copyright (C) 2022 Alexander Wolz, mail@alexanderwolz.de
# based on:
#	- device/generic/goldfish/64bitonly/product/sdk_phone64_arm64.mk

QEMU_USE_SYSTEM_EXT_PARTITIONS := true
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# This is a build configuration for a full-featured build of the
# Open-Source part of the tree. It's geared toward a US-centric
# build quite specifically for the emulator, and might not be
# entirely appropriate to inherit from for on-device configurations.

PRODUCT_ENFORCE_ARTIFACT_PATH_REQUIREMENTS := relaxed

# All components inherited here go to system image
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_system.mk)

# All components inherited here go to system_ext image
$(call inherit-product, $(SRC_TARGET_DIR)/product/handheld_system_ext.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony_system_ext.mk)

# All components inherited here go to product image
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_product.mk)

PRODUCT_SDK_ADDON_SYS_IMG_SOURCE_PROP := \
    development/sys-img/images_arm64-v8a_source.prop_template

# All components inherited here go to vendor or vendor_boot image
$(call inherit-product, device/generic/goldfish/arm64-vendor.mk)
$(call inherit-product, device/generic/goldfish/64bitonly/product/emulator64_vendor.mk)
$(call inherit-product, device/generic/goldfish/emulator64_arm64/device.mk)

# Define the host tools and libs that are parts of the SDK.
$(call inherit-product-if-exists, sdk/build/product_sdk.mk)
$(call inherit-product-if-exists, development/build/product_sdk.mk)

PRODUCT_NAME := catfish
PRODUCT_DEVICE := catfish
PRODUCT_BRAND := alexanderwolz
PRODUCT_MODEL := Catfish Android
