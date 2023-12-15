# Copyright (C) 2023 Alexander Wolz, mail@alexanderwolz.de

PRODUCT_MAKEFILES := \
	whaleshark_emulator_arm64:$(LOCAL_DIR)/whaleshark_emulator_arm64.mk \
	whaleshark_emulator_x86_64:$(LOCAL_DIR)/whaleshark_emulator_x86_64.mk

COMMON_LUNCH_CHOICES := \
	whaleshark_emulator_arm64-userdebug
	whaleshark_emulator_x86_64-userdebug
