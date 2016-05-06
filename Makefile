MPV_VERSION = 0.17.0

all: io.mpv.app.x86_64.xdgapp net.gstreamer.libav.x86_64.xdgapp

io.mpv.app.x86_64.xdgapp: io.mpv.app.json Makefile
	./build.sh io.mpv.app.json $(MPV_VERSION)

io.mpv.app.json: io.mpv.app.json.in Makefile
	cat io.mpv.app.json.in | sed 's,@VERSION@,$(MPV_VERSION),' > $@

net.gstreamer.libav.x86_64.xdgapp: net.gstreamer.libav.json Makefile
	./build_gst-libav.sh

# FIXME add to all when it works
com.libretro.retroarch.x86_64.xdgapp: com.libretro.retroarch.json Makefile
	./build.sh com.libretro.retroarch.json git
