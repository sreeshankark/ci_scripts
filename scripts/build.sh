#!/bin/bash

cd ~/$(CR_NAME)

source build/envsetup.sh;

lunch twrp_$CODENAME-eng;

mka recoveryimage -j$(nproc --all);
