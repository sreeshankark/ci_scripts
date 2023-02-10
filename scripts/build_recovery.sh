#!/bin/bash

cd ~
cd ${CR_NAME}
source build/envsetup.sh;

lunch twrp_$CODENAME-eng || lunch omni_$CODENAME-eng || { printf "Compilation failed.\n"; exit 1; }

if [ $TARGET = "pbrp" ];
then
mka $TARGET -j$(nproc --all);
else
mka adbd $TARGET -j$(nproc --all);
fi
exit 0;
