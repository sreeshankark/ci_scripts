#!/bin/bash

cd ~
git config --global user.name "$USERNAME"
git config --global user.email "$USERMAIL"

mkdir ~/OrangeFox_sync
cd ~/OrangeFox_sync
git clone https://gitlab.com/OrangeFox/sync.git
cd ~/OrangeFox_sync/sync/
./orangefox_sync.sh --branch 12.1 --path ~/orangefox
cd ~/orangefox
git clone $DT_REPO -b $DT_BRANCH "device/$OEM/$CODENAME"

exit 0
