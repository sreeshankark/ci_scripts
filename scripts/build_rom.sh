#!/bin/bash

cd ~
cd ${ROM_NAME}
export ALLOW_MISSING_DEPENDENCIES=true
source build/envsetup.sh;

lunch $CROM_$CODENAME-$VARIANT

mka bacon -j$(nproc --all);
exit 0;
