#!/bin/bash

cd ~
cd ${ROM_NAME}
export ALLOW_MISSING_DEPENDENCIES=true
source build/envsetup.sh;

lunch $PRODUCT_NAME-$VARIANT

mka evolution -j$(nproc --all)
exit 0;
