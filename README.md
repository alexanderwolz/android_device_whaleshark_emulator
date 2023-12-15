# Whale Shark - an AAOS device configuration for ARM64-based Android Emulator hosts

![GitHub release (latest by date)](https://img.shields.io/github/v/release/alexanderwolz/android_device_whaleshark_emulator)
![GitHub](https://img.shields.io/badge/arch-arm64v8-orange)
![GitHub](https://img.shields.io/github/license/alexanderwolz/android_device_whaleshark_emulator)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/alexanderwolz/android_device_whaleshark_emulator)
![GitHub all releases](https://img.shields.io/github/downloads/alexanderwolz/android_device_whaleshark_emulator/total?color=informational)


## 🧑‍💻 About

This device configuration is intented to be run in an Android Emulator on ARM64-based hosts, such as Apple MacBook Pro with M1 processor

See also [aosp_docker](https://github.com/alexanderwolz/aosp_docker) for a Docker-based tool chain and [android_tools](https://github.com/alexanderwolz/android_device_whaleshark_tools) for additonal sync and flash scripts.


## 🛠️ Setup

### Download AOSP repository

See [here](https://github.com/alexanderwolz/android_device_whaleshark_manifest) for setup of AOSP repository and dependencies.


## ⚙️ Build the product

This follows the normal AOSP approach, e.g.
1. ```source build/envsetup.sh```
2. ```lunch whaleshark_emulator_arm64-userdebug```
3. ```make clobber``` (optionally, cleans target folder)
4. ```m -j$(nproc --all)```
5. See compiled files at ```$AOSP_HOME/out/target/product/emulator64_arm64```

## 🖥️ Create Android Virtual Device (AVD)

Consultate [this repository](https://github.com/alexanderwolz/android_device_whaleshark_tools) for predefined AVD configurations and setup instructions.

## ✨ Flash the build

You can use the [sync_remote_emulator_images.sh](https://github.com/alexanderwolz/android_device_whaleshark_tools/blob/main/bin/sync_remote_emulator_images.sh) script from [here](https://github.com/alexanderwolz/android_device_whaleshark_tools) to directly sync the emulator images to your ```$ANDROID_SDK_HOME/system-images``` folder

