#!/bin/bash

cd ~
cd ${ROM_NAME}
source build/envsetup.sh;
lunch $PRODUCT_NAME-$VARIANT
mka evolution -j$(nproc --all)
exit 0;
