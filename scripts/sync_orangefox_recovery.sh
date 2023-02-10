#!/bin/bash

# Change to the Home Directory
cd ~

# Clone the Sync Repo
mkdir ~/OrangeFox_sync
cd ~/OrangeFox_sync
git clone https://gitlab.com/OrangeFox/sync.git
cd ~/OrangeFox_sync/sync/
./orangefox_sync.sh --branch 12.1 --path ~/${CR_NAME}

exit 0
