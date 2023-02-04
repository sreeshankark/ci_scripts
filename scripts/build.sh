#!/bin/bash

cd ~/${CR_NAME};
source build/envsetup.sh;

lunch twrp_$CODENAME-eng;

mka $TARGET -j$(nproc --all);
exit 0;
