[![ci-docker](https://github.com/humbertodias/ps3dev-sdl2/actions/workflows/deploy.yml/badge.svg)](https://github.com/humbertodias/ps3dev-sdl2/actions/workflows/deploy.yml)
[![](https://images.microbadger.com/badges/image/hldtux/ps3dev-sdl2.svg)](https://microbadger.com/images/hldtux/ps3dev-sdl2)
[![](https://img.shields.io/docker/pulls/hldtux/ps3dev-sdl2.svg?maxAge=604800)](https://hub.docker.com/r/hldtux/ps3dev-sdl2/)

# ps3dev-sdl2

A Docker Image for PS3 Development with sdl2 compiled for powerpc64-ps3-elf

Contains:

* [ps3toolchain](https://github.com/ps3dev/ps3toolchain)
  * binutils-ppu 2.42
  * binutils-spu 2.22
  * gcc-ppu 13.2.0
  * gcc-spu 9.5.0 
* [ps3libraries](https://github.com/humbertodias/ps3libraries)
* [SDL_PSL1GHT](https://github.com/zeldin/SDL_PSL1GHT) + [SDL_PSL1GHT_Libs](https://github.com/zeldin/SDL_PSL1GHT_Libs)
  * sdl - 1.3.0
  * sdl_mixer - 1.2.11
  * sdl_image - 1.2.10
  * sdl_ttf - 2.0.10
  * sdl_net - 1.2.7
  * sdl_gfx - 2.0.27

* [SDL2_PSL1GHT](https://github.com/humbertodias/SDL2_PSL1GHT)  + [SDL2_PSL1GHT_Libs](https://github.com/humbertodias/SDL2_PSL1GHT_Libs)
  * sdl2 - 2.31.0
  * sdl2_mixer - 2.8.0
  * sdl2_image - 2.8.2
  * sdl2_ttf - 2.22.0
  * sdl2_gfx - 2.22.0

# How to use

```sh
./ps3dev-sdl2 CMD_TO_COMPILE
```

Sample
[main.c](./main.c)
```sh
./ps3dev-sdl2 make pkg

file main.elf
```
Output
```
main.elf: ELF 64-bit MSB executable, 64-bit PowerPC or cisco 7500, Unspecified or Power ELF V1 ABI, version 1 (SYSV), statically linked, with debug_info, not stripped
```
The main.pkg on RPCS3
![image](https://github.com/humbertodias/ps3dev-sdl2/assets/9255997/7adab790-76ae-494b-9aab-624c937e7ad4)

> [!NOTE]  
> ppu-gcc : is the compiler for the PowerPC architecture, particularly for the Cell Broadband Engine Architecture (Cell BE), which is used in the PlayStation 3 (PS3) gaming console.
> 
