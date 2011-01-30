#!/bin/sh
CFLAGS="-I$PSL1GHT/target/include/SDL -I$PS3DEV/host/ppu/include/ -I$PS3DEV/host/ppu/include/freetype2"
export CFLAGS
for SCRIPT in scripts/*.sh; do "$SCRIPT" || { echo "$SCRIPT: Failed."; exit 1; } done

