#!/bin/bash

cd "out/target/product/$CODENAME";
date
echo spawn git.sh > git.sh;
echo expect "Username for 'https://github.com':" >> git.sh;
echo send $USERNAME >> git.sh;
echo sleep 3 >> git.sh;
echo spawn git.sh >> git.sh;
echo expect "Password for 'https://$USERNAME@github.com':" >> git.sh;
echo send $GH_TOKEN >> git.sh;

mkdir "upload/$CR_NAME/date +”%d-%b-%Y";
cp *.zip "upload/$CR_NAME/date +”%d-%b-%Y";
cp recovery.img "upload/$CR_NAME/date +”%d-%b-%Y";
cd "upload/$CR_NAME/date +”%d-%b-%Y";
git init;
git remote add origin https://github.com/Sanju0910/releases.git;
git branch -M $CR_NAME;
git fetch;
git pull origin $CR_NAME;
git add .
git commit -m "$CR_NAME : date +”%d-%b-%Y”";
git push origin $CR_NAME;
sleep 3;
bash out/target/product/$CODENAME/git.sh;
exit 0;
