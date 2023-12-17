# Copyright (C) 2023 Alexander Wolz, mail@alexanderwolz.de
# product based on:
#	- device/generic/car/sdk_car_arm64.mk

# Use new multi display approach
EMULATOR_DYNAMIC_MULTIDISPLAY_CONFIG := false

# Since Android 14: derive directly from device/generic/car/sdk_car_arm64.mk
$(call inherit-product, device/generic/car/sdk_car_arm64.mk)

# Use common definitions
$(call inherit-product, device/alexanderwolz/whaleshark/common/whaleshark_common.mk)

EMULATOR_VENDOR_NO_SOUND := true

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := alexanderwolz
PRODUCT_MANUFACTURER := alexanderwolz
PRODUCT_NAME := whaleshark_emulator_arm64
PRODUCT_MODEL := Whale Shark AAOS on ARM64 Emulator

# we reuse the original device configuration from device/generic/car/emulator_car64_arm64
PRODUCT_DEVICE := emulator_car64_arm64
