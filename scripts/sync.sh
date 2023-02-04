#!/bin/bash

cd ~
mkdir $CR_NAME;
cd $CR_NAME;
git config --global user.name "$USERNAME"
git config --global user.email "$USERMAIL"
repo init -u $CR_REPO -b $CR_BRANCH;

repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags;

git clone $DT_REPO -b $DT_BRANCH "device/$OEM/$CODENAME";

exit 0;
