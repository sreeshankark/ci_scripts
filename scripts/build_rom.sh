#!/bin/bash

cd ~
cd ${ROM_NAME}
cd ~/roms/$

export CCACHE_DIR=~/ccache/${ROM_NAME}/avicii

export CCACHE_EXEC=$(which ccache)

export USE_CCACHE=1

ccache -M 8G

ccache -z
export ALLOW_MISSING_DEPENDENCIES=true
source build/envsetup.sh;

lunch $PRODUCT_NAME-$VARIANT

mka evolution
exit 0;
