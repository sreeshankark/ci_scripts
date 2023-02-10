#!/bin/bash

cd /root
mkdir orangefox
git config --global user.name "$USERNAME"
git config --global user.email "$USERMAIL"

mkdir /root/OrangeFox_sync
cd /root/OrangeFox_sync
git clone https://gitlab.com/OrangeFox/sync.git
cd /root/OrangeFox_sync/sync/
./orangefox_sync.sh --branch "12.1" --path /root/orangefox
cd ../..
cd orangefox
git clone https://github.com/Sanju0910/orangefox_device_oneplus_avicii.git -b android-12.1 device/oneplus/avicii

exit 0
