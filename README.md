# Catfish - an AOSP13 Automotive Emulator Device

![GitHub release (latest by date)](https://img.shields.io/github/v/release/alexanderwolz/android_device_catfish)
![GitHub](https://img.shields.io/badge/aosp-13-orange)
![GitHub](https://img.shields.io/badge/arch-arm64v8-orange)
![GitHub](https://img.shields.io/github/license/alexanderwolz/android_device_catfish)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/alexanderwolz/android_device_catfish)
![GitHub all releases](https://img.shields.io/github/downloads/alexanderwolz/android_device_catfish/total?color=informational)

## 🧑‍💻 About

This device is intented to be run in an Android Emulator on an Apple MacBook Pro with M1 processor (ARM64)

See also https://github.com/alexanderwolz/android_device_catfish_tools for additonal tools

## 🛠️ Installation

1. checkout this repository to ```$AOSP_HOME/device/alexanderwolz/catfish```

2. Build device with ```lunch catfish-eng``` and ```m -j$(nproc --all)```
