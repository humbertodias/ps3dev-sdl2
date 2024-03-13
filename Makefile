IMAGE=hldtux/ps3dev-sdl2

build:
	DOCKER_DEFAULT_PLATFORM=linux/amd64 docker build . -t ${IMAGE}

test: test-sdl1	test-sdl2

test-sdl1:
	./ps3dev-sdl2 "cd tests/sdl1 && make"

test-sdl2:
	./ps3dev-sdl2 "cd tests/sdl2 && make"

run:
	DOCKER_DEFAULT_PLATFORM=linux/amd64 docker run -it -v`pwd`:/build ${IMAGE}

compile:
	ppu-gcc main.c -o main -mcpu=cell \
	-I/usr/local/ps3dev/ppu/include \
	-I/usr/local/ps3dev/portlibs/ppu/include \
	-L/usr/local/ps3dev/portlibs/ppu/lib \
	-L/usr/local/ps3dev/spu/spu/lib \
	-L/usr/local/ps3dev/ppu/powerpc64-ps3-elf/lib \
	-I/usr/local/ps3dev/portlibs/ppu/include/SDL2 -I/usr/local/ps3dev/portlibs/ppu/include -L/usr/local/ps3dev/portlibs/ppu/lib -lSDL2_image -lSDL2 -lm -lgcm_sys -lrsx -lsysutil -lrt -llv2 -lio -laudio

elf:	compile
	ppu-strip main -o main.elf
	sprxlinker main.elf
	fself main.elf main.self
	make_self main.elf main.self

GAME_TITLE=GAME_TITLE
GAME_ID=GAME_ID
CONTENT_ID=UP0000-ABCDEFG_00-0000000000000000
APPVERSION=1.0
pkg:	elf
	mkdir -p pkg/USRDIR
	make_self_npdrm main.elf pkg/USRDIR/EBOOT.BIN ${CONTENT_ID}
	cp /usr/local/ps3dev/bin/sfo.xml .
	sed -i "s/01\.00/${APPVERSION}/g" sfo.xml
	sfo.py --title ${GAME_TITLE} --appid ${GAME_ID} -f /usr/local/ps3dev/bin/sfo.xml pkg/PARAM.SFO
	pkg.py --contentid ${CONTENT_ID} pkg/ main.pkg

clean:
	rm -f *.elf *.pkg *.self *.o sfo.xml