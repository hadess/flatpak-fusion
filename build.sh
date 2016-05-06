#!/bin/sh

FILE=$1
VERSION=$2

APPID=`basename $FILE .json`

echo ========== Building $APPID ================
rm -rf app
xdg-app-builder --ccache --require-changes --repo=repo --subject="${APPID} ${VERSION}" ${EXPORT_ARGS-} app $FILE && \
xdg-app build-bundle repo/ $APPID.x86_64.xdgapp $APPID master
