#!/bin/sh
CFLAGS="-I$PSL1GHT/target/include/SDL -I$PS3DEV/host/ppu/include/ -I$PS3DEV/host/ppu/include/freetype2"
PKG_CONFIG_PATH="$PS3DEV/host/ppu/lib/pkgconfig"
export CFLAGS
export PKG_CONFIG_PATH
for SCRIPT in scripts/*.sh; do "$SCRIPT" || { echo "$SCRIPT: Failed."; exit 1; } done

