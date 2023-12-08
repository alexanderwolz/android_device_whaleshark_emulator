# Catfish - an AOSP14 Automotive Emulator Device

![GitHub release (latest by date)](https://img.shields.io/github/v/release/alexanderwolz/android_device_catfish)
![GitHub](https://img.shields.io/badge/aosp-14-orange)
![GitHub](https://img.shields.io/badge/arch-arm64v8-orange)
![GitHub](https://img.shields.io/github/license/alexanderwolz/android_device_catfish)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/alexanderwolz/android_device_catfish)
![GitHub all releases](https://img.shields.io/github/downloads/alexanderwolz/android_device_catfish/total?color=informational)

## 🧑‍💻 About

This device is intented to be run in an Android Emulator on an Apple MacBook Pro with M1 processor (ARM64)

See also https://github.com/alexanderwolz/android_device_catfish_tools for additonal tools

## 🛠️ Installation

Clone this repository to ```$AOSP_HOME/device/alexanderwolz/catfish```

```
cd $AOSP_HOME
git clone https://github.com/alexanderwolz/android_device_catfish.git device/alexanderwolz/catfish
```

## ⚙️ Build

This follows the normal AOSP approach, e.g.
1. ```source build/envsetup.sh```
2. ```lunch catfish-eng```
3. ```rm -rf /aosp/out``` (cleans build target folder)
4. ```m -j$(nproc --all)```
5. See compiled files at ```$AOSP_HOME/out/target/product/catfish```
