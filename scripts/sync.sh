#!/bin/bash

cd ~;
mkdir $CR_NAME;
cd $CR_NAME;
git config --global user.name "$USERNAME"
git config --global user.email "$USERMAIL"
repo init -u $CR_REPO -b $CR_BRANCH;

repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags;

if [ -z $DT_BRANCH ] then
git clone $DT_REPO "device/$OEM/$CODENAME";
else
git clone $DT_REPO -b $DT_BRANCH "device/$OEM/$CODENAME";
fi

exit 0;
