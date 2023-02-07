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

git clone $FIRMWARE_REPO -b $FIRMWARE_BRANCH "vendor/$OEM/firmware"

if [ -d "prebuilt/clang/kernel" ];
   then 
      git clone https://github.com/Sanju0910/prebuilts_clang_kernel_linux-x86_clang-r416183b prebuilt/clang/kernel;
fi
exit 0;
