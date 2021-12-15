#!/bin/bash

echo DRONE_COMMIT ${DRONE_COMMIT} DRONE_COMMIT_SHA ${DRONE_COMMIT_SHA}
 
node -v
git branch 
# git fetch origin +refs/heads/master
# git checkout master
# git fetch origin refs/pull/536/head
# git merge ${DRONE_COMMIT_SHA}

BASEDIR=$(dirname "$0")
export ENV=$1
echo ENV is "$ENV"

FILE=$BASEDIR/zoomLibs/ios/lib/MobileRTC.framework/MobileRTC
if [[ -f "$FILE" ]]; then
    echo "$FILE exists."
else
    aws s3 cp s3://sharecaremobile-files/zoomLibs/ scripts/zoomLibs  --recursive
fi

LAST_VERSION=$(/bin/cat $BASEDIR/.version)
NEW_VERSION=$(echo ${LAST_VERSION} | awk -F. -v OFS=. '{$NF++;print}')
echo $NEW_VERSION > $BASEDIR/.version
echo NEW_VERSION is "$NEW_VERSION"

which node
node ./config/auto-build.js --project sharecare --env $ENV --version $NEW_VERSION

yarn run auto-build --project sharecare --env $ENV --version $NEW_VERSION

