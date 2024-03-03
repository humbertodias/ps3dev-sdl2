[![ci-docker](https://github.com/humbertodias/ps3dev-sdl2/actions/workflows/deploy.yml/badge.svg)](https://github.com/humbertodias/ps3dev-sdl2/actions/workflows/deploy.yml)
[![](https://images.microbadger.com/badges/image/hldtux/psd3dev-sdl2.svg)](https://microbadger.com/images/hldtux/psd3dev-sdl2)
[![](https://img.shields.io/docker/pulls/hldtux/psd3dev-sdl2.svg?maxAge=604800)](https://hub.docker.com/r/hldtux/psd3dev-sdl2/)

# psd3dev-sdl2

A Docker Image for PS3 Development with sdl2 compiled for powerpc64-ps3-elf.

Contains:

* [ps3toolchain](https://github.com/ps3dev/ps3toolchain)
* [ps3libraries](https://github.com/humbertodias/ps3libraries)
* [SDL_PSL1GHT](https://github.com/zeldin/SDL_PSL1GHT)
  * sdl - 1.3.0
  * sdl_mixer - 1.2.11
  * sdl_image - 1.2.10
  * sdl_ttf - 2.0.10
  * sdl_net - 1.2.7
  * sdl_gfx - 2.0.27
* [SDL2_PSL1GHT](https://github.com/humbertodias/SDL2_PSL1GHT)
  * sdl2 - 2.0.13 
  * sdl2_mixer - 2.8.0
  * sdl2_image - 2.8.2
  * sdl2_ttf - 2.22.0
  * sdl2_net - 2.2.0


# How to use

```sh
./ps3dev-sdl2 CMD_TO_COMPILE
```

Sample
```sh
echo '
#include <stdio.h>
#include "SDL.h"

int main() {
    SDL_version version;
    SDL_VERSION(&version);

    printf("SDL version %d.%d.%d", version.major, version.minor, version.patch);

    return 0;
}' > sdl-version.c

./ps3dev-sdl2 \
ppu-gcc sdl-version.c -o sdl-version.elf \
-I/usr/local/ps3dev/portlibs/ppu/include/SDL2 \
-L/usr/local/ps3dev/portlibs/ppu/lib -lSDL2

file sdl-version.elf
```
Output
```
sdl-version.elf: ELF 64-bit MSB executable, 64-bit PowerPC or cisco 7500, Unspecified or Power ELF V1 ABI, version 1 (SYSV), statically linked, with debug_info, not stripped
```

> [!NOTE]  
> ppu-gcc : is the compiler for the PowerPC architecture, particularly for the Cell Broadband Engine Architecture (Cell BE), which is used in the PlayStation 3 (PS3) gaming console.
> 
