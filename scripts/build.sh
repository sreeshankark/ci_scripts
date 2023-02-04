#!/bin/bash

cd ~
cd $CR_NAME
pwd;
source build/envsetup.sh;

lunch twrp_$CODENAME-eng;

mka recoveryimage -j$(nproc --all);
