#!/usr/bin/env bash

echo "##############"
echo "#  PATCHKIT  #"
echo "##############"

curl -L "https://github.com/patchkit-net/patchkit-tools/releases/download/v3.1.2/patchkit-tools-linux-x86_64.zip" --output patchkit-tools-linux-x86_64.zip
unzip -o patchkit-tools-linux-x86_64.zip -d patchkit/

echo "##############"
echo "#    BUILD   #"
echo "##############"


echo $SECRET_KEY
echo $API_KEY
echo $ZIP_PATH

ls -R $ZIP_PATH
#curl -L $ZIP_PATH --output output.zip
unzip -o "$ZIP_PATH"/build.zip -d patchkit/output/


echo "##############"
echo "#   UPLOAD   #"
echo "##############"

chmod -R +x patchkit/
cd ./patchkit
#set the width of the terminal for patchkit
set :format_options, truncate: 80
bash ./patchkit-tools make-version -s "$SECRET_KEY" -a "$API_KEY" -l github_actions -f ./output -x