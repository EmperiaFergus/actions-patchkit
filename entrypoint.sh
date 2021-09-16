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
echo "current directory"
pwd
#unzip -o "$ZIP_PATH"/build.zip -d ./patchkit/output/
#we can only upload a folder with one exe
rm "patchkit/output/UnityCrashHandler32.exe"
rm "patchkit/output/UnityCrashHandler64.exe"

echo "##############"
echo "#   UPLOAD   #"
echo "##############"
ls -R
chmod -R +x patchkit/
echo "moving to patchkit"
cd ./patchkit

#if [ -s app/core/utils/progress_bar.rb]; then
if [ -s app/core/utils/progress_bar.rb ]; then
  echo "progress bar exists"
fi

sed -i 's/IO\.console\.winsize\[1\]/800/g' app/core/utils/progress_bar.rb

sed -n '21p' < app/core/utils/progress_bar.rb
#if [ -s changelog.txt ]; then
#  echo "changes made!"
#fi  
#ls
#echo "current directory"
#pwd
bash ./patchkit-tools make-version -s "$SECRET_KEY" -a "$API_KEY" -l github_actions -f $ZIP_PATH -x
#bash ./patchkit-tools make-version -s "ac1ae6ae296777d8f700b72ea5231cc8" -a "ccfb4cd4e4aea80d14fcc2b649001f0b" -l github_actions -f ./ -x