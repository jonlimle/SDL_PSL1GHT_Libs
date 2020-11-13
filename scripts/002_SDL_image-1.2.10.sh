./download.sh SDL_image-1.2.10.tar.gz || { exit 1; }

tar xfvz archives/SDL_image-1.2.10.tar.gz || { exit 1; }

cd SDL_image-1.2.10 || { exit 1; }

cp ../archives/config.sub ../archives/config.guess . || { exit 1; }

cat ../patches/SDL_image-1.2.10.patch | patch -p1 || { exit 1; }

./configure --prefix="$PS3DEV/portlibs/ppu" --host=powerpc64-ps3-elf \
	--disable-sdltest \
	--with-sdl-exec-prefix="$PS3DEV/portlibs/ppu" \
	--disable-shared \
	LIBPNG_CFLAGS="`$PS3DEV/portlibs/ppu/bin/libpng-config --cflags`" \
	LIBPNG_LIBS="`$PS3DEV/portlibs/ppu/bin/libpng-config --libs`" \
    	|| { exit 1; }

make && make install || { exit 1; }
