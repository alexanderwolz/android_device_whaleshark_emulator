# Copyright (C) 2025 Alexander Wolz, mail@alexanderwolz.de

PRODUCT_MAKEFILES := \
	whaleshark_car_emulator_arm64:$(LOCAL_DIR)/whaleshark_car_emulator_arm64.mk \
	whaleshark_car_emulator_x86_64:$(LOCAL_DIR)/whaleshark_car_emulator_x86_64.mk

COMMON_LUNCH_CHOICES := \
	whaleshark_car_emulator_arm64-trunk_staging-userdebug \
	whaleshark_car_emulator_x86_64-trunk_staging-userdebug
