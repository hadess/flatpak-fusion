MPV_VERSION = 0.17.0

all: io.mpv.app.x86_64.xdgapp

io.mpv.app.x86_64.xdgapp: io.mpv.app.json
	./build.sh io.mpv.app.json $(MPV_VERSION)

io.mpv.app.json: io.mpv.app.json.in Makefile
	cat io.mpv.app.json.in | sed 's,@VERSION@,$(MPV_VERSION),' > $@
