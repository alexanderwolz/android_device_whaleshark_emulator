# Whale Shark - an AAOS14 device configuration for ARM64-based Android Emulator hosts

![GitHub release (latest by date)](https://img.shields.io/github/v/release/alexanderwolz/android_device_whaleshark_emulator)
![GitHub](https://img.shields.io/badge/aosp-14-orange)
![GitHub](https://img.shields.io/badge/arch-arm64v8-orange)
![GitHub](https://img.shields.io/github/license/alexanderwolz/android_device_whaleshark_emulator)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/alexanderwolz/android_device_whaleshark_emulator)
![GitHub all releases](https://img.shields.io/github/downloads/alexanderwolz/android_device_whaleshark_emulator/total?color=informational)


## 🧑‍💻 About

This device configuration is intented to be run in an Android Emulator on ARM64-based hosts, such as Apple MacBook Pro with M1 processor

See also [here](https://github.com/alexanderwolz/android_device_whaleshark_tools) for additonal sync and flash scripts.


## 🛠️ Setup

This product is currently being tested against *UP1A.231105.003* (android-14.0.0_r14)

See [Android tags](https://source.android.com/docs/setup/about/build-numbers) for other build ids and branches


### Download AOSP repository

1. ```cd $AOSP_HOME``` (this is a placeholder for your workdir)
2. ```repo init --depth=1 -u https://android.googlesource.com/platform/manifest -b android-14.0.0_r14```
3. ```repo sync -c --no-tags --no-clone-bundle -j$(nproc --all)```


### Add product configurations

Clone [common repository](https://github.com/alexanderwolz/android_device_whaleshark_common) to ```$AOSP_HOME/device/alexanderwolz/whaleshark/common```

Clone this repository to ```$AOSP_HOME/device/alexanderwolz/whaleshark/emulator```

1. ```cd $AOSP_HOME```
2. ```git clone https://github.com/alexanderwolz/android_device_whaleshark_common.git device/alexanderwolz/whaleshark/common```
3. ```git clone https://github.com/alexanderwolz/android_device_whaleshark_emulator.git device/alexanderwolz/whaleshark/emulator```


## ⚙️ Build the product

This follows the normal AOSP approach, e.g.
1. ```source build/envsetup.sh```
2. ```lunch whaleshark_emulator_arm64-userdebug```
3. ```rm -rf /aosp/out``` (cleans build target folder)
4. ```m -j$(nproc --all)```
5. See compiled files at ```$AOSP_HOME/out/target/product/emulator64_arm64```
