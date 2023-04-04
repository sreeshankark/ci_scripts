#!/bin/bash

cd ~;
mkdir $CR_NAME;
cd $CR_NAME;
git config --global user.name "$USERNAME";
git config --global user.email "$USERMAIL";
repo init --depth=1 -u $CR_REPO -b $CR_BRANCH;

repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags;
rm -rf bootable/recovery
rm -rf system/vold
git clone https://github.com/PitchBlackRecoveryProject/android_bootable_recovery -b fbe-patches bootable/recovery --depth=1;
git clone https://github.com/PitchBlackRecoveryProject/android_system_vold -b fbe-patches system/vold --depth=1;
git clone $DT_REPO -b $DT_BRANCH "device/$OEM/$CODENAME" --depth=1;

exit 0;
