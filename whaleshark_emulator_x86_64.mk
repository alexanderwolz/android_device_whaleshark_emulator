# Copyright (C) 2023 Alexander Wolz, mail@alexanderwolz.de
# product based on:
#	- device/generic/car/sdk_car_x86_64.mk

# Since Android 14: derive directly from device/generic/car/sdk_car_x86_64.mk
$(call inherit-product, device/generic/car/sdk_car_x86_64.mk)

# Use common definitions
$(call inherit-product, device/alexanderwolz/whaleshark/common/whaleshark_common.mk)

# Enable cluster display
BUILD_EMULATOR_CLUSTER_DISPLAY := false
ENABLE_CLUSTER_OS_DOUBLE := false

# Cluster / co-driver display
ifeq (true,$(BUILD_EMULATOR_CLUSTER_DISPLAY))
PRODUCT_COPY_FILES += \
    device/generic/car/emulator/cluster/display_settings.xml:system/etc/display_settings.xml
PRODUCT_PRODUCT_PROPERTIES += \
    hwservicemanager.external.displays=1,400,600,120,0 \
    persist.service.bootanim.displays=8140900251843329
ifeq (true,$(ENABLE_CLUSTER_OS_DOUBLE))
DEVICE_PACKAGE_OVERLAYS += device/generic/car/emulator/cluster/osdouble_overlay
else
DEVICE_PACKAGE_OVERLAYS += device/generic/car/emulator/cluster/overlay
endif  # ENABLE_CLUSTER_OS_DOUBLE
endif  # BUILD_EMULATOR_CLUSTER_DISPLAY

EMULATOR_VENDOR_NO_SOUND := true

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := alexanderwolz
PRODUCT_MANUFACTURER := alexanderwolz
PRODUCT_NAME := whaleshark_emulator_x86_64
PRODUCT_MODEL := Whale Shark AAOS on x86_64 Emulator

# we reuse the original device configuration from device/generic/car/emulator_car64_x86_64
PRODUCT_DEVICE := emulator_car64_x86_64
