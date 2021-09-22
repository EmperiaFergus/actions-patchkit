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


rm "patchkit/output/UnityCrashHandler32.exe"
rm "patchkit/output/UnityCrashHandler64.exe"
rm "patchkit/output/StandaloneOSX"
echo "##############"
echo "#   UPLOAD   #"
echo "##############"

chmod -R +x patchkit/
cd ./patchkit
if [ -s app/core/utils/progress_bar.rb ]; then
  echo "progress bar exists"
fi

sed -i 's/IO\.console\.winsize\[1\]/800/g' app/core/utils/progress_bar.rb
sed -n '21p' < app/core/utils/progress_bar.rb
bash ./patchkit-tools make-version -s "$SECRET_KEY" -a "$API_KEY" -l github_actions -f $ZIP_PATH -x