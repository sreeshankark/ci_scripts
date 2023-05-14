#!/bin/bash

cd /root
mkdir orangefox
git config --global user.name "$USERNAME"
git config --global user.email "$USERMAIL"

mkdir /root/OrangeFox_sync
cd /root/OrangeFox_sync
git clone https://gitlab.com/OrangeFox/sync.git
cd /root/OrangeFox_sync/sync/
bash orangefox_sync.sh --branch "12.1" --path /root/orangefox
cd ../..
cd orangefox
git clone https://github.com/Sanju0910/orangefox_device_oneplus_avicii.git -b android-12.1 device/oneplus/avicii
rm -rf bootable/recovery 
git clone https://github.com/Sanju0910/recovery bootable/recovery
git clone https://gitlab.com/OrangeFox/misc/theme.git bootable/recovery/gui/theme
cd system/vold
git init
git remote add pbrp https://github.com/PitchBlackRecoveryProject/android_system_vold.git
git fetch pbrp fbe-patches
git cherry-pick 148cca409a26244f85b2c6f3a6c67c6284478178
cd ../..
exit 0
