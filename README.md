# Whale Shark - an AAOS device configuration for 64-bit-based Android Emulator hosts

![GitHub release (latest by date)](https://img.shields.io/github/v/release/alexanderwolz/android_device_whaleshark_emulator)
![GitHub](https://img.shields.io/badge/arch-arm64v8;_x86__64-orange)
![GitHub](https://img.shields.io/github/license/alexanderwolz/android_device_whaleshark_emulator)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/alexanderwolz/android_device_whaleshark_emulator)
![GitHub all releases](https://img.shields.io/github/downloads/alexanderwolz/android_device_whaleshark_emulator/total?color=informational)


## 🧑‍💻 About

This device configuration is intented to be run on Android Virtual Device (AVD) emulator hosts with a 64-bit CPU, such as the new MacBook generations with Apple Silicon processor (M1/M2/M3).

See also [aosp-docker](https://github.com/alexanderwolz/aosp-docker) for a Docker-based tool chain and [android-build-tools](https://github.com/alexanderwolz/android-build-tools) for additonal sync and flash scripts.


## 🛠️ Setup

### Download AOSP repository

See [manifest](https://github.com/alexanderwolz/android_device_whaleshark_manifest/tree/android-14) for setup of AOSP repository and dependencies.


## ⚙️ Build the product

This follows the normal AOSP approach, e.g.
1. ```source build/envsetup.sh```
2. ```lunch whaleshark_emulator_arm64-userdebug```
3. ```make clobber``` (optionally, cleans target folder)
4. ```m -j$(nproc --all)```
5. See compiled files at ```$AOSP_HOME/out/target/product/emulator_car64_arm64```


## ✨ Flash the build

You can use the [sync_remote_emulator_images.sh](https://github.com/alexanderwolz/android-build-tools/blob/main/bin/sync_remote_emulator_images.sh) script from [here](https://github.com/alexanderwolz/android-build-tools) to directly sync the emulator images to your ```$ANDROID_SDK_HOME/system-images``` folder.


## 🖥️ Android Virtual Device (AVD) configuration

### Setup

Copy the appropriate avd folder to your localhost into *$HOME/.android/avd*

```mkdir -p $HOME/.android/avd```

```cp -r avd/whaleshark-34.avd $HOME/.android/avd/whaleshark-34.avd```

```cp avd/whaleshark-34.ini $HOME/.android/avd/whaleshark-34.ini```


### Run the Emulator

Install the Android SDK and set ```$ANDROID_HOME```. See also [this](https://developer.android.com/studio).

Install the Android Emulator with version 33.1.23.x or higher.

Execute the Emulator: ```$ANDROID_HOME/emulator/emulator -avd whaleshark-34 -show-kernel```
