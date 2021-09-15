#!/usr/bin/env bash

echo "##############"
echo "#  PATCHKIT  #"
echo "##############"

curl -L "https://github.com/patchkit-net/patchkit-tools/releases/download/v3.1.2/patchkit-tools-linux-x86_64.zip" --output patchkit-tools-linux-x86_64.zip
unzip -o patchkit-tools-linux-x86_64.zip -d patchkit/

echo "##############"
echo "#    BUILD   #"
echo "##############"
find / -name "build.zip"

echo $1
echo $2
echo $3

#curl -L $path --output output.zip
unzip -o $path -d patchkit/output

echo "##############"
echo "#   UPLOAD   #"
echo "##############"
chmod -R +x patchkit/
cd ./patchkit
bash ./patchkit-tools make-version -s $1 -a $2 -l github_actions -f ./output -x