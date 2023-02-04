#!/bin/bash

cd ~
cd $CR_NAME
cd out/target/product/$CODENAME;
DATE=date
mkdir "upload/$CR_NAME/$DATE";
cp *.zip "upload/$CR_NAME/$DATE";
cp recovery.img "upload/$CR_NAME/$DATE";
cd "upload/$CR_NAME/$DATE";
git init;
git remote add origin https://github.com/Sanju0910/releases.git;
git branch -M $CR_NAME;
git fetch;
git pull origin $CR_NAME;
git add .
git commit -m "$CR_NAME : $DATE";
git push origin $CR_NAME;
sleep 6;
echo $USERNAME
sleep 6;
echo $GH_TOKEN
exit 0;
