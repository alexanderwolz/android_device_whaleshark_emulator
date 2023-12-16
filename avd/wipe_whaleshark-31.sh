#!/bin/bash
# Copyright (C) 2023 Alexander Wolz <mail@alexanderwolz.de>

AVD_FOLDER="$HOME/.android/avd/whaleshark-31.avd"

pushd "$AVD_FOLDER" >/dev/null || exit 1
echo "Wiping $AVD_FOLDER"
find . -mindepth 1 ! -name "config.ini" -delete
echo "Done"
popd >/dev/null