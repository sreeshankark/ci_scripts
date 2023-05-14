#!/bin/bash

cd ~
cd orangefox
cd out/target/product/$CODENAME;
curl -T recovery.img temp.sh
curl -T *.zip temp.sh
exit 0;
