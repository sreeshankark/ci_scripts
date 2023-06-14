#!/bin/bash

cd ~
cd ${ROM_NAME}
export USE_CCACHE=1

export CCACHE_EXEC=/usr/bin/ccache
ccache -M 50G
source build/envsetup.sh;
lunch $PRODUCT_NAME-$VARIANT
mka evolution -j2
exit 0;
