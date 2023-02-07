#!/bin/bash

cd ~
cd $ROM_NAME
cd out/target/product/$CODENAME;
curl -T recovery.img temp.sh
curl -T *${CODENAME}*.zip temp.sh
exit 0;
