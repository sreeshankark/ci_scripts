#!/bin/bash

cd ~;
mkdir $ROM_NAME;
cd $ROM_NAME;
git config --global user.name "$USERNAME";
git config --global user.email "$USERMAIL";

# Initialize RED source
repo init -u $ROM_REPO -b $ROM_BRANCH;

# Sync RED source
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags;

# Clone GREEN source
git clone $DEVICE_REPO -b $DEVICE_BRANCH "device/$OEM/$CODENAME";

git clone $VENDOR_REPO -b $VENDOR_BRANCH "vendor/$OEM/$CODENAME";

git clone $KERNEL_REPO -b $KERNEL_BRANCH "kernel/$OEM/$CODENAME";

git clone $HARDWARE_REPO -b $FIRMWARE_BRANCH "vendor/$OEM/firmware"

git clone git clone https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86 -b master prebuilt/clang/kernel;
exit 0;
