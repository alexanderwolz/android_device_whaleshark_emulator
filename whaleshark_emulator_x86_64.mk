# Copyright (C) 2023 Alexander Wolz, mail@alexanderwolz.de
# based on:
#	- device/generic/goldfish/car/sdk_car_x86_64.mk
#	- device/generic/car/emulator/aosp_car_emulator.mk
#	- device/generic/goldfish/64bitonly/product/sdk_phone64_x86_64.mk
#	- build/make/target/product/sdk_phone_x86_64.mk (deprecated?)

# Use own source properties
PRODUCT_SDK_ADDON_SYS_IMG_SOURCE_PROP := $(LOCAL_PATH)/source.properties

## Android Automotive

PRODUCT_PACKAGE_OVERLAYS := device/generic/car/common/overlay

# Enable Setup Wizard. This overrides the setting in emulator_vendor.mk
PRODUCT_SYSTEM_EXT_PROPERTIES += ro.setupwizard.mode?=OPTIONAL

$(call inherit-product, device/generic/car/common/car.mk)
$(call inherit-product, device/generic/car/emulator/audio/car_emulator_audio.mk)
$(call inherit-product, device/generic/car/emulator/rotary/car_rotary.mk)

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml 

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

# Define the host tools and libs that are parts of the SDK.
$(call inherit-product-if-exists, sdk/build/product_sdk.mk)
$(call inherit-product-if-exists, development/build/product_sdk.mk)


## Android Common

QEMU_USE_SYSTEM_EXT_PARTITIONS := true
PRODUCT_USE_DYNAMIC_PARTITIONS := true
#PRODUCT_ENFORCE_ARTIFACT_PATH_REQUIREMENTS := relaxed

# All components inherited here go to system image
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_system.mk)

# All components inherited here go to system_ext image
$(call inherit-product, $(SRC_TARGET_DIR)/product/handheld_system_ext.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony_system_ext.mk)

# All components inherited here go to product image
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_product.mk)

# All components inherited here go to vendor or vendor_boot image (from sdk_phone_x86_64.mk)
$(call inherit-product, device/generic/goldfish/x86_64-vendor.mk)
$(call inherit-product, device/generic/goldfish/64bitonly/product/emulator_vendor.mk)
$(call inherit-product, device/generic/goldfish/emulator_x86_64/device.mk)

EMULATOR_VENDOR_NO_SOUND := true

# Use common definitions
$(call inherit-product, device/alexanderwolz/whaleshark/common/whaleshark_common.mk)

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := alexanderwolz
PRODUCT_MANUFACTURER := alexanderwolz
PRODUCT_NAME := whaleshark_emulator_x86_64
PRODUCT_MODEL := Whale Shark AAOS on x86_64 Emulator

# we reuse the original device configuration from device/generic/goldfish/emulator_x86_64
PRODUCT_DEVICE := emulator_x86_64
