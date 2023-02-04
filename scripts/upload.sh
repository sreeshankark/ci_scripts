#!/bin/bash

cd ~
cd ${OUT}
curl -sL https://git.io/file-transfer | sh
./transfer wet recovery.img
./transfer wet *.zip
exit 0;
