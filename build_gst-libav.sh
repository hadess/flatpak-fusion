#!/bin/sh

# Install with:
# xdg-app --user remote-add --no-gpg-verify local repo
# xdg-app --user install local org.freedesktop.Platform.GStreamer.libav 1.4

FILE=net.gstreamer.libav.json

APPID=`basename $FILE .json`
SUBJECT="Nightly build of gst-libav, `date`"

echo ========== Building $APPID ================
rm -rf runtime
xdg-app-builder --ccache --repo=repo --build-only --subject="${SUBJECT}" ${EXPORT_ARGS-} runtime $FILE
cat << EOF > runtime/metadata
[Runtime]
name=org.freedesktop.Platform.GStreamer.libav
runtime=org.freedesktop.Platform/x86_64/1.4
sdk=org.freedesktop.Sdk/x86_64/1.4
tags=nightly;
EOF

rm -rf runtime/files/{bin,include,share} runtime/file/lib/gstreamer-1.0/*.la

if [ ! -d repo ] ; then
    ostree  init --mode=archive-z2 --repo=repo
fi
ostree commit --repo=repo --owner-uid=0 --owner-gid=0 --no-xattrs --branch=runtime/org.freedesktop.Platform.GStreamer.libav/x86_64/1.4  --subject="${SUBJECT}" runtime
xdg-app build-update-repo repo
xdg-app build-finish runtime
xdg-app build-bundle repo/ $APPID.x86_64.xdgapp $APPID master
