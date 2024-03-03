IMAGE=hldtux/ps3dev-sdl2

build:
	DOCKER_DEFAULT_PLATFORM=linux/amd64 docker build . -t ${IMAGE}

test: test-sdl1	test-sdl2

test-sdl1:
	./ps3dev-sdl2 "cd tests/sdl1 && make"

test-sdl2:
	./ps3dev-sdl2 "cd tests/sdl2 && make"