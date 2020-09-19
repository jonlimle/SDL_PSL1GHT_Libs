#!/bin/sh
CFLAGS="-I$PSL1GHT/ppu/include/SDL -I$PS3DEV/portlibs/ppu/include/ -I$PS3DEV/portlibs/ppu/include/freetype2"
LDFLAGS="-L$PSL1GHT/ppu/lib -L$PS3DEV/portlibs/ppu/lib -lrt -llv2"
PKG_CONFIG_PATH="$PS3DEV/portlibs/ppu/lib/pkgconfig"
export CFLAGS
export LDFLAGS
export PKG_CONFIG_PATH

./download.sh config.guess
./download.sh config.sub

## Fetch the build scripts.
BUILD_SCRIPTS=`ls scripts/*.sh | sort`

## If specific steps were requested...
if [ $1 ]; then

  ## Find the requested build scripts.
  REQUESTS=""

  for STEP in $@; do
    SCRIPT=""
    for i in $BUILD_SCRIPTS; do
      if [ `basename $i | cut -d'_' -f1` -eq $STEP ]; then
        SCRIPT=$i
        break
      fi
    done

    [ -z $SCRIPT ] && { echo "ERROR: unknown step $STEP"; exit 1; }

    REQUESTS="$REQUESTS $SCRIPT"
  done

  ## Only run the requested build scripts
  BUILD_SCRIPTS="$REQUESTS"
fi

## Run the build scripts.
for SCRIPT in $BUILD_SCRIPTS; do "$SCRIPT" || { echo "$SCRIPT: Failed."; exit 1; } done
