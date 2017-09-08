#!/bin/sh -x
set -e
echo "Build started on $(date)"

# delete /build/outputs folder
BUILD_OUTPUTS=$(pwd)/build/outputs/
mkdir -p $BUILD_OUTPUTS
rm -Rf $BUILD_OUTPUTS/*
echo "==============================================================="
echo "Copy Latest Pointzi Libs"

cp -r $POINTZI_LIB_PATH/* .
cp  $POINTZI_LIB_PATH/../ExportPlist.plist build/

echo "==============================================================="
echo "Build Pointzi demos"

# ------------------- build PZStatic ------------------------

pushd .

cd Example_StaticLibrary

# install third-party pods
pod install

# clean project
xcodebuild clean -workspace PointziDemo.xcworkspace -scheme PointziDemo -sdk iphoneos -configuration Release

# archive app
xcodebuild archive -workspace PointziDemo.xcworkspace -scheme PointziDemo -archivePath $BUILD_OUTPUTS/PZStatic.xcarchive

popd

# export ipa
xcodebuild -exportArchive -archivePath $BUILD_OUTPUTS/PZStatic.xcarchive -exportPath $BUILD_OUTPUTS/ -exportOptionsPlist ./build/ExportPlist.plist
mv $BUILD_OUTPUTS/PointziDemo.ipa $BUILD_OUTPUTS/PZStatic.ipa

# ------------------- build PZDynamic ------------------------

pushd .

cd $POINTZI_POD_DIR/Example_DynamicFramework

# install third-party pods
pod install

# clean project
xcodebuild clean -workspace PointziDemo.xcworkspace -scheme PointziDemo -sdk iphoneos -configuration Release

# archive app
xcodebuild archive -workspace PointziDemo.xcworkspace -scheme PointziDemo -archivePath $BUILD_OUTPUTS/PZDynamic.xcarchive

popd

# export ipa
xcodebuild -exportArchive -archivePath $BUILD_OUTPUTS/PZDynamic.xcarchive -exportPath $BUILD_OUTPUTS/ -exportOptionsPlist ./build/ExportPlist.plist
mv $BUILD_OUTPUTS/PointziDemo.ipa $BUILD_OUTPUTS/PZDynamic.ipa

# ---------------------- upload to hockeyapp ---------------------

/usr/local/bin/puck -submit=auto -download=true -notes="$(git log -1)" \
                    -notes_type=markdown \
                    -source_path=$(pwd) \
                    -repository_url=https://github.com/StreetHawkSDK/ios \
                    -api_token=$HOCKEYAPP_TOKEN \
                    -app_id=$HOCKEYAPP_APPID_DYNAMIC \
                    $BUILD_OUTPUTS/SHDynamic.xcarchive
/usr/local/bin/puck -submit=auto -download=true -notes="$(git log -1)" \
                    -notes_type=markdown \
                    -source_path=$(pwd) \
                    -repository_url=https://github.com/StreetHawkSDK/ios \
                    -api_token=$HOCKEYAPP_TOKEN \
                    -app_id=$HOCKEYAPP_APPID_STATIC \
                    $BUILD_OUTPUTS/SHStatic.xcarchive

