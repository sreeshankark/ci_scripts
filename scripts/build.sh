#!/bin/bash

source build/envsetup.sh;

lunch twrp_$CODENAME-eng;

mka recoveryimage -j$(nproc --all);
