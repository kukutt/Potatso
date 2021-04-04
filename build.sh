#!/bin/bash

home_path=$(cd `dirname $0`; pwd)
target_name="StrongSelf"

upload_path="/Users/kangxg/Desktop/appName/myProjectTest/archive/"

target_path="$home_path/StrongSelf/"
archive_path="$home_path/archive/$target_name"

ipa_path="$home_path/ipa/"
provisoning_profile="$home_path/ExportOptions.plist"
log_path="$home_path/log.txt"




workspace_name="$home_path/$target_name/$target_name.xcworkspace"

archivie_name="$home_path/archive/$target_name.xcarchive"

configuration="Debug"

scheme="devStrongSelf"


echo "根路径： $home_path"
echo "归档路径： $archive_path"
echo "归档文件名称： $archivie_name"
echo "ipa路径：$ipa_path"
echo "plist路径：$provisoning_profile"
echo "configuration配置:$configuration"
echo "target_name项目名称:$target_name"
echo "workspace_name工作空间名称:$workspace_name"
echo "scheme名称:$scheme"


xcodebuild \
clean -workspace "$workspace_name" \
-scheme "$scheme" \
-configuration "$configuration"



xcodebuild \
archive -workspace "$workspace_name" \
-scheme "$scheme" \
-configuration "$configuration" \
-archivePath "$archive_path"


xcodebuild  \
-exportArchive -archivePath  "$archivie_name"  \
-exportPath "$ipa_path"      \
-exportOptionsPlist "$provisoning_profile" >> $log_path

exit 0
