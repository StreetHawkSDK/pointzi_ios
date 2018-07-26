#!/bin/bash -x
set -e
echo "Build started on $(date)"

# delete /build/outputs folder
BUILD_OUTPUTS=$(pwd)/build/outputs/
mkdir -p $BUILD_OUTPUTS
rm -Rf $BUILD_OUTPUTS/*
echo "==============================================================="
echo "Copy Latest Pointzi Libs"

if [ -z "$POINTZI_LIB_PATH" ]
then
   echo "POINTZI_LIB_PATH not set"
   exit 1
fi
cp -r $POINTZI_LIB_PATH/* .

echo "==============================================================="
echo "Update Test App Info.plist"

# read from record BuildInfo.plist
git_version=$(/usr/libexec/PlistBuddy -c "Print :GitVersion" "BuildInfo.plist")
git_branch=$(/usr/libexec/PlistBuddy -c "Print :GitBranch" "BuildInfo.plist")
build_time=$(date)

# set to App's Info.plist
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion '${git_branch}-${git_version}-${build_time}'" "Example_DynamicFramework/PointziDemo/Supporting Files/Info.plist"
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion '${git_branch}-${git_version}-${build_time}'" "Example_StaticLibrary/PointziDemo/Supporting Files/Info.plist"

echo "==============================================================="
echo "Build Pointzi demos"

export PATH="$HOME/.fastlane/bin:$PATH"

security unlock-keychain -p $BUILD_PASSWORD "/Users/hawk/Library/Keychains/login.keychain-db"

# ------------------- build PZStatic ------------------------

pushd .

cd Example_StaticLibrary
pod install
pod update
fastlane match adhoc --force_for_new_devices
fastlane gym --scheme PointziDemo --export_method "ad-hoc" --output_directory "$BUILD_OUTPUTS" --output_name "PZStatic.ipa" --clean true

popd

# ------------------- build PZDynamic ------------------------

pushd .

cd Example_DynamicFramework
pod install
pod update
fastlane match adhoc --force_for_new_devices
fastlane gym --scheme PointziDemo --export_method "ad-hoc" --output_directory "$BUILD_OUTPUTS" --output_name "PZDynamic.ipa" --clean true

popd

# ---------------------- upload to hockeyapp ---------------------

/usr/local/bin/puck -submit=auto -download=true -notes="$(git log -1)" \
                    -notes_type=markdown \
                    -source_path=$(pwd) \
                    -repository_url=https://github.com/StreetHawkSDK/ios \
                    -api_token=$HOCKEYAPP_TOKEN \
                    -app_id=$HOCKEYAPP_APPID_DYNAMIC \
                    $BUILD_OUTPUTS/PZDynamic.ipa
/usr/local/bin/puck -submit=auto -download=true -notes="$(git log -1)" \
                    -notes_type=markdown \
                    -source_path=$(pwd) \
                    -repository_url=https://github.com/StreetHawkSDK/ios \
                    -api_token=$HOCKEYAPP_TOKEN \
                    -app_id=$HOCKEYAPP_APPID_STATIC \
                    $BUILD_OUTPUTS/PZStatic.ipa

# ---------------------- upload to pod ---------------------
if [ ! -z "$GIT_USERNAME" ]; then
    git config user.name "$GIT_USERNAME"
fi
if [ ! -z "$GIT_EMAIL" ]; then
    git config user.email "$GIT_EMAIL"
fi
if [ ! -z "$COMMIT_MESSAGE" ]; then
    head_version=$(git -C $POINTZI_LIB_PATH tag -l --points-at HEAD | grep -v '1'||:)
    current_version=$(git -C $POINTZI_LIB_PATH describe --tags --abbrev=0)
    # if current recheable tag version include beta as a suffix, then do a beta release with the same version number
    if [[ $current_version =~ ^[0-9]+\.[0-9]+\.[0-9]+-beta.*$ ]]; then
        release_version=$([[ $current_version =~ ^([0-9]+\.[0-9]+\.[0-9]+-beta).*$ ]] && echo ${BASH_REMATCH[1]})+$(date +%s)
    # if current recheable tag version does not include beta as a suffix but head version is empty,
    # then bump up patch number and do a beta release
    elif [ -z $head_version ]; then
        release_version=$(git -C $POINTZI_LIB_PATH describe --tags --abbrev=0 | python -c 'import semver, sys;print(semver.bump_patch(sys.stdin.read()))')-beta+$(date +%s)
    # if current recheable tag version does not include beta as a suffix and head version is not empty,
    # then check if the version number adhere to semver x.x.x if so, do a formal release
    elif [[ $head_version =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        release_version=$head_version
    else
        echo "head tag version fetched from source repo is neither a beta version nor release version, please check!"
        exit 128
    fi
    sed -i .bak 's/\(s.version[[:space:]]*=[[:space:]]"\).*/\1'"$release_version"'"/g' pointzi.podspec
    git add pointzi.podspec
    git add BuildInfo.plist
    git add Pointzi
    git add Carousel
    git add "Example_DynamicFramework/PointziDemo/Supporting Files/Info.plist"
    git add "Example_StaticLibrary/PointziDemo/Supporting Files/Info.plist"
    git commit -m "$COMMIT_MESSAGE"
    git tag $release_version
    git push origin
    git push origin --tags
    # only when it is a formal release version, then push to pod trunk
    if [[ $release_version =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        pod spec lint "pointzi.podspec" --verbose
        pod trunk push pointzi.podspec --allow-warnings
    fi
fi
