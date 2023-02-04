#!/bin/bash

cd ~
cd $CR_NAME
cd out/target/product/$CODENAME;
mkdir upload;
cd upload;
mkdir $CR_NAME;
cd $CR_NAME;
cd ../..
cp *.zip "upload/$CR_NAME";
cp recovery.img "upload/$CR_NAME";
cd "upload/$CR_NAME/$DATE";
cd upload;
cd $CR_NAME;
git init;
git remote add origin https://github.com/Sanju0910/releases.git;
git branch -M $CR_NAME;
git fetch;
git pull origin $CR_NAME;
git add .
git commit -m "$CR_NAME : $DATE";
git push origin $CR_NAME;
echo $USERNAME
sleep 6;
echo $GH_TOKEN
exit 0;
