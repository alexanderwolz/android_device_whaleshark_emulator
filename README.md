# Catfish - an AOSP12 Emulator Device

This device is intented to be run in an Android Emulator on an Apple MacBook Pro with M1 processor (ARM64)

See also https://github.com/alexanderwolz/android_device_catfish_tools for additonal tools

## Installation

1. checkout this repository to ```$AOSP_HOME/device/alexanderwolz/catfish```

2. Build device with ```lunch catfish-eng``` and ```m -j$(nproc --all)```
