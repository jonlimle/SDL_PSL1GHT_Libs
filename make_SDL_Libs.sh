#!/bin/sh

SDL_INSTALL_PATH="$PS3DEV/portlibs/ppu/"
#if you install SDL to a non-default place, add $SDL_INSTALL_PATH/bin to you PATH
#SDL_INSTALL_PATH="$PS3DEV/portlibs/ppu/sdl-1.2.14/"
CFLAGS="-I$SDL_INSTALL_PATH/include/SDL -I$PS3DEV/portlibs/ppu/include/ -I$PS3DEV/portlibs/ppu/include/freetype2 -I$PSL1GHT/ppu/include/"
LDFLAGS="-L$SDL_INSTALL_PATH/lib -L$PSL1GHT/ppu/lib -L$PS3DEV/portlibs/ppu/lib -lrt -llv2 -laudio"
PKG_CONFIG_PATH="$PS3DEV/portlibs/ppu/lib/pkgconfig"
export CFLAGS
export LDFLAGS
export PKG_CONFIG_PATH
export SDL_INSTALL_PATH
for SCRIPT in scripts/*.sh; do "$SCRIPT" || { echo "$SCRIPT: Failed."; exit 1; } done

