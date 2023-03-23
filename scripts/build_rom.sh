#!/bin/bash

cd ~
cd ${ROM_NAME}
export ALLOW_MISSING_DEPENDENCIES=true
source build/envsetup.sh;

lunch $PRODUCT_NAME-$VARIANT

if [ $ROM_NAME = "evolutionx" ] then
mka evolution -j$(nproc --all);
else
mka bacon -j$(nproc --all);
fi
exit 0;
