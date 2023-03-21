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

rm -rf hardware/oplus;

git clone $HARDWARE_REPO -b $HARDWARE_BRANCH "hardware/oplus";

rm -rf prebuilt/clang/kernel;

git clone https://gitlab.com/Sanju0910/clang-r487747 -b main prebuilt/clang/kernel/linux-x86;

exit 0;
