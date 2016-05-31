#!/bin/sh

# Install with:
# flatpak --user remote-add --no-gpg-verify local repo
# flatpak --user install local org.freedesktop.Platform.GStreamer.libav 1.4

FILE=`dirname $0`/net.gstreamer.libav.json

APPID=`basename $FILE .json`
NAME=org.freedesktop.Platform.GStreamer.libav
SUBJECT="Nightly build of gst-libav, `date`"
BRANCH=1.4

echo ========== Building $APPID ================
rm -rf runtime
flatpak-builder --ccache --repo=repo --build-only --subject="${SUBJECT}" ${EXPORT_ARGS-} runtime $FILE
cat << EOF > runtime/metadata
[Runtime]
name=$NAME
runtime=org.freedesktop.Platform/x86_64/$BRANCH
sdk=org.freedesktop.Sdk/x86_64/$BRANCH
tags=nightly;
EOF

rm -rf runtime/files/{bin,include,share} runtime/file/lib/gstreamer-1.0/*.la

if [ ! -d repo ] ; then
    ostree  init --mode=archive-z2 --repo=repo
fi
ostree commit --repo=repo --owner-uid=0 --owner-gid=0 --no-xattrs --branch=runtime/org.freedesktop.Platform.GStreamer.libav/x86_64/$BRANCH --subject="${SUBJECT}" runtime
flatpak build-update-repo repo
flatpak build-finish runtime
flatpak build-bundle --runtime repo/ $APPID.x86_64.xdgapp $NAME $BRANCH
