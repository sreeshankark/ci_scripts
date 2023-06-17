#!/bin/bash

cd ~
cd ${ROM_NAME}
export USE_CCACHE=1

export CCACHE_EXEC=/usr/bin/ccache
ccache -M 100G
source build/envsetup.sh;
lunch $PRODUCT_NAME-$VARIANT
mka bacon -j16
exit 0;
