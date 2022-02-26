# Copyright (C) 2022 Alexander Wolz, mail@alexanderwolz.de
# based on:
#   - device/generic/car/emulator/aosp_car_emulator.mk

PRODUCT_COPY_FILES += $(LOCAL_PATH)/advancedFeatures.ini:advancedFeatures.ini

PRODUCT_SYSTEM_EXT_PROPERTIES += ro.setupwizard.mode?=OPTIONAL

# derive from automotive config
$(call inherit-product, device/generic/car/common/car.mk)
# This overrides device/generic/car/common/car.mk
$(call inherit-product, device/generic/car/emulator/audio/car_emulator_audio.mk)
$(call inherit-product, device/generic/car/emulator/rotary/car_rotary.mk)

# Define the host tools and libs that are parts of the SDK.
$(call inherit-product, sdk/build/product_sdk.mk)
$(call inherit-product, development/build/product_sdk.mk)

PRODUCT_NAME := catfish
PRODUCT_DEVICE := catfish
PRODUCT_BRAND := alexanderwolz
PRODUCT_MODEL := Catfish Android
