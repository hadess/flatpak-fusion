#!/bin/sh

FILE=$1
VERSION=$2

APPID=`grep -Po '(?<="id": ")[^"]*' $FILE`
if grep -q 'build-extension": true' $FILE ; then
  RUNTIME_FLAG="--runtime"
  TYPE="runtime"
else
  TYPE="app"
fi

echo "========== Building $APPID ($TYPE) ================"
rm -rf app
flatpak-builder --ccache --require-changes --repo=repo --subject="${APPID} ${VERSION}" ${EXPORT_ARGS-} app $FILE && \
flatpak build-bundle $RUNTIME_FLAG repo/ $APPID.x86_64.flatpak $APPID master
