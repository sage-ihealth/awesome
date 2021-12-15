#!/bin/bash

# BASEDIR=$(dirname "$0")
# rm -rf android/build
# rm -rf android/app/build
# rm -rf android/app/release
# rm -rf node_modules/@ihealth/react-native-utils/android/libs/*

# ./scripts/pre-ios-android.sh $1

# /bin/cp -rf scripts/zoomLibs/android/libs/ node_modules/@ihealth/react-native-utils/android/libs/

# npm run fixZoom
# # ./scripts/mobilertc-precompile.sh

# # export WORKSPACE=$(cd $(dirname $0);echo $PWD)/../
# # echo $WORKSPACE

# # nvm use v14.15.4

# # export NPMJS_TOKEN=d69af043-e58c-4660-98d9-0f991b269d4a
# # npm config set //registry.npmjs.org/:_authToken=$NPMJS_TOKEN
# # npm install

# # yarn run auto-build --project sharecare --env production --version 2.0.0.1
# # cp -rf scripts/zoomLibs/android/libs/ node_modules/@ihealth/react-native-utils/android/libs/
# # npm run fixZoom

# npx react-native bundle --platform android --dev false --minify false --entry-file index.js --bundle-output android/app/src/main/assets/index.android.bundle --assets-dest android/app/build/intermediates/res/merged/release/

# a trial: no gradle no clean，1，version; 2 zoom; 3 npx; 4 done

# ------------------------------fastlane----------------------------------
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
cd android
# fastlane clean
fastlane release
# ./gradlew app:assembleRelease;
