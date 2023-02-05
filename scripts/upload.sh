#!/bin/bash

cd ~
cd $CR_NAME/out/target/product/$CODENAME;
curl -sL https://git.io/file-transfer | sh;
./transfer wet recovery.img;
./transfer wet *.zip;
exit 0;
