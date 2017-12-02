#!/bin/sh
CFLAGS="-I$PSL1GHT/ppu/include/SDL -I$PS3DEV/portlibs/ppu/include/ -I$PS3DEV/portlibs/ppu/include/freetype2"
LDFLAGS="-L$PSL1GHT/ppu/lib -L$PS3DEV/portlibs/ppu/lib -lrt -llv2"
PKG_CONFIG_PATH="$PS3DEV/portlibs/ppu/lib/pkgconfig"
export CFLAGS
export LDFLAGS
export PKG_CONFIG_PATH
if [ ! -f config.guess ]; then wget --continue http://git.savannah.gnu.org/cgit/config.git/plain/config.guess; fi
if [ ! -f config.sub ]; then wget --continue http://git.savannah.gnu.org/cgit/config.git/plain/config.sub; fi
for SCRIPT in scripts/*.sh; do "$SCRIPT" || { echo "$SCRIPT: Failed."; exit 1; } done

