IMAGE=hldtux/ps3dev-sdl2

run:
	DOCKER_DEFAULT_PLATFORM=linux/amd64 docker run -it --rm -v "`pwd`:/src" -w /src ${IMAGE} bash