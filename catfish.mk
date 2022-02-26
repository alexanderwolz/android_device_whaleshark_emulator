# Copyright (C) 2022 Alexander Wolz, mail@alexanderwolz.de
# based on:
#   - build/target/product/sdk_phone_arm64.mk

QEMU_USE_SYSTEM_EXT_PARTITIONS := true
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Enable mainline checking for exact this product name
ifeq (sdk_phone_arm64,$(TARGET_PRODUCT))
PRODUCT_ENFORCE_ARTIFACT_PATH_REQUIREMENTS := relaxed
endif

# All components inherited here go to system image
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_system.mk)

# All components inherited here go to system_ext image
$(call inherit-product, $(SRC_TARGET_DIR)/product/handheld_system_ext.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony_system_ext.mk)

# All components inherited here go to product image
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_product.mk)

# All components inherited here go to vendor or vendor_boot image
$(call inherit-product-if-exists, device/generic/goldfish/arm64-vendor.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulator_vendor.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/board/emulator_arm64/device.mk)

# Define the host tools and libs that are parts of the SDK.
$(call inherit-product, sdk/build/product_sdk.mk)
$(call inherit-product, development/build/product_sdk.mk)

PRODUCT_NAME := catfish
PRODUCT_DEVICE := catfish
PRODUCT_BRAND := alexanderwolz
PRODUCT_MODEL := Catfish Android

# Disable <uses-library> checks for SDK product. It lacks some libraries (e.g.
# RadioConfigLib), which makes it impossible to translate their module names to
# library name, so the check fails.
PRODUCT_BROKEN_VERIFY_USES_LIBRARIES := true
