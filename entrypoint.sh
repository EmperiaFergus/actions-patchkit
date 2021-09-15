#!/usr/bin/env bash

curl -L "https://github.com/patchkit-net/patchkit-tools/releases/download/v3.1.2/patchkit-tools-linux-x86_64.zip" --output patchkit-tools-linux-x86_64.zip
unzip -o patchkit-tools-linux-x86_64.zip -d patchkit/

curl -L $path --output output.zip
unzip -o patchkit-tools-linux-x86_64.zip -d patchkit/output

chmod -R +x patchkit/
cd ./patchkit
bash ./patchkit-tools make-version -s $secret-key -a $api-key -l "uploaded using github actions" -f ./output -x