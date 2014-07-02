wget --continue http://www.libsdl.org/projects/SDL_net/release/SDL_net-1.2.7.tar.gz || { exit 1; }

tar xfvz ./SDL_net-1.2.7.tar.gz || { exit 1; }

cd SDL_net-1.2.7 || { exit 1; }

cat ../patches/SDL_net-1.2.7.patch | patch -p1 || { exit 1; }

#this is seems like a bug in (the version of) PSL1GHT/ps3toolchain
# (that I happen to have installed)
CFLAGS="$CFLAGS -I$PSL1GHT/ppu/include"
export CFLAGS

./configure --prefix="$SDL_INSTALL_PATH" --host=powerpc64-ps3-elf \
	--disable-sdltest \
	--disable-shared \
    	|| { exit 1; }

make && make install || { exit 1; }
