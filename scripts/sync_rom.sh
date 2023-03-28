#!/bin/bash

cd ~;
mkdir $ROM_NAME;
cd $ROM_NAME;
git config --global user.name "$USERNAME";
git config --global user.email "$USERMAIL";

# Initialize RED source
repo init --depth=1 -u $ROM_REPO -b $ROM_BRANCH;

# Sync RED source
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags;

# Clone GREEN source
git clone $DEVICE_REPO --depth=1 -b $DEVICE_BRANCH "device/$OEM/$CODENAME";

git clone $VENDOR_REPO --depth=1 -b $VENDOR_BRANCH "vendor/$OEM/$CODENAME";

git clone $KERNEL_REPO --depth=1 -b $KERNEL_BRANCH "kernel/$OEM/$CODENAME";

rm -rf hardware/oplus;

git clone $HARDWARE_REPO --depth=1 -b $HARDWARE_BRANCH "hardware/oplus";

rm -rf prebuilts/clang/kernel;

git clone https://gitlab.com/Sanju0910/clang-r487747 --depth=1 -b main prebuilts/clang/kernel/linux-x86/clang-r487747;

exit 0;
