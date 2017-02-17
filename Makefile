.NOTPARALLEL:

MPV_VERSION = 0.18.0
MPV_SHA256SUM = b656638d4f6bce2621baaacb60d8be384aa492fcd86dfd43996aaa2c16fee02b

all: io.mpv.app.x86_64.flatpak net.gstreamer.libav.x86_64.flatpak com.libretro.retroarch.x86_64.flatpak

io.mpv.app.x86_64.flatpak: io.mpv.app.json Makefile
	./build.sh io.mpv.app.json $(MPV_VERSION)

io.mpv.app.json: io.mpv.app.json.in Makefile
	cat io.mpv.app.json.in | sed 's,@VERSION@,$(MPV_VERSION),' | sed 's,@MPV_SHA256SUM@,$(MPV_SHA256SUM),' > $@

net.gstreamer.libav.x86_64.flatpak: net.gstreamer.libav.json Makefile
	./build_gst-libav.sh

com.libretro.retroarch.x86_64.flatpak: com.libretro.retroarch.json Makefile
	./build.sh com.libretro.retroarch.json git
