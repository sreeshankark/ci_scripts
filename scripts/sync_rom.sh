#!/bin/bash

cd ~;
mkdir $ROM_NAME;
cd $ROM_NAME;
git config --global user.name "$USERNAME";
git config --global user.email "$USERMAIL";

# Initialize RED source
repo init --depth=1 --no-repo-verify -u $ROM_REPO -b $ROM_BRANCH -g default,-mips,-darwin,-notdefault;

# Sync RED source

repo sync -c -j$(nproc --all) --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync;

# Clone GREEN source
git clone $DEVICE_REPO --depth=1 -b $DEVICE_BRANCH "device/$OEM/$CODENAME";

git clone $VENDOR_REPO --depth=1 -b $VENDOR_BRANCH "vendor/$OEM/$CODENAME";

git clone $KERNEL_REPO --depth=1 -b $KERNEL_BRANCH "kernel/$OEM/$CODENAME";

rm -rf hardware/oplus;

git clone $HARDWARE_REPO --depth=1 -b $HARDWARE_BRANCH "hardware/oplus";

git clone https://gitlab.com/Sanju0910/vendor_oneplus_apps --depth=1 "vendor/oneplus/apps";

git clone https://github.com/Sanju0910/android_packages_apps_OPlusExtras -b RisingOS "packages/apps/OPlusExtras";

git clone https://github.com/Sanju0910/android_vendor_dolby_atmos "vendor/dolby/atmos";


exit 0;
