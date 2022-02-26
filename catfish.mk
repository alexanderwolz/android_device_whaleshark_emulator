# Copyright (C) 2022 Alexander Wolz, mail@alexanderwolz.de
# based on:
#   - device/generic/car/emulator/aosp_car_emulator.mk
#   - build/target/product/aosp_arm64.mk
#   - build/target/product/sdk_phone_arm64.mk
#   - build/target/product/emulator_vendor.mk

PRODUCT_COPY_FILES += $(LOCAL_PATH)/advancedFeatures.ini.arm:advancedFeatures.ini

PRODUCT_SYSTEM_EXT_PROPERTIES += ro.setupwizard.mode?=OPTIONAL

# derive from automotive config
$(call inherit-product, device/generic/car/common/car.mk)

# This overrides device/generic/car/common/car.mk
$(call inherit-product, device/generic/car/emulator/audio/car_emulator_audio.mk)
$(call inherit-product, device/generic/car/emulator/rotary/car_rotary.mk)

PRODUCT_USE_DYNAMIC_PARTITIONS := true

# All components inherited here go to system image
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk) #enable 64 bit zygote
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_system.mk) #generic handheld system

# All components inherited here go to vendor or vendor_boot image
$(call inherit-product-if-exists, device/generic/goldfish/arm64-vendor.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulator_vendor.mk) #emulator-related vendor
$(call inherit-product, $(SRC_TARGET_DIR)/board/generic_arm64/device.mk) #kernel

# Enable mainline checking for excat this product name
ifeq (aosp_arm64,$(TARGET_PRODUCT))
PRODUCT_ENFORCE_ARTIFACT_PATH_REQUIREMENTS := relaxed
endif

# Special settings for GSI releasing
ifeq (aosp_arm64,$(TARGET_PRODUCT))
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_release.mk)
endif

# Define the host tools and libs that are parts of the SDK.
$(call inherit-product, sdk/build/product_sdk.mk)
$(call inherit-product, development/build/product_sdk.mk)

PRODUCT_NAME := catfish
PRODUCT_DEVICE := catfish
PRODUCT_BRAND := alexanderwolz
PRODUCT_MODEL := Catfish Android
