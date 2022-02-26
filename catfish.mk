# Copyright (C) 2022 Alexander Wolz, mail@alexanderwolz.de
# based on:
#   - device/generic/car/emulator/aosp_car_emulator.mk

# derive from automotive config
$(call inherit-product, device/generic/car/common/car.mk)

PRODUCT_NAME := catfish
PRODUCT_DEVICE := catfish
PRODUCT_BRAND := alexanderwolz
PRODUCT_MODEL := Catfish Android
