.NOTPARALLEL:

MPV_VERSION = 0.17.0
MPV_SHA256SUM = 602cd2b0f5fc7e43473234fbb96e3f7bbb6418f15eb8fa720d9433cce31eba6e

all: io.mpv.app.x86_64.xdgapp net.gstreamer.libav.x86_64.xdgapp com.libretro.retroarch.x86_64.xdgapp

io.mpv.app.x86_64.xdgapp: io.mpv.app.json Makefile
	./build.sh io.mpv.app.json $(MPV_VERSION)

io.mpv.app.json: io.mpv.app.json.in Makefile
	cat io.mpv.app.json.in | sed 's,@VERSION@,$(MPV_VERSION),' | sed 's,@MPV_SHA256SUM@,$(MPV_SHA256SUM),' > $@

net.gstreamer.libav.x86_64.xdgapp: net.gstreamer.libav.json Makefile
	./build_gst-libav.sh

com.libretro.retroarch.x86_64.xdgapp: com.libretro.retroarch.json Makefile
	./build.sh com.libretro.retroarch.json git
