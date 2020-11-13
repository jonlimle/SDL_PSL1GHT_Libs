./download.sh SDL_ttf-2.0.10.tar.gz || { exit 1; }

tar xfvz archives/SDL_ttf-2.0.10.tar.gz || { exit 1; }

cd SDL_ttf-2.0.10 || { exit 1; }

cp ../archives/config.sub ../archives/config.guess . || { exit 1; }

cat ../patches/SDL_ttf-2.0.10.patch | patch -p1 || { exit 1; }

./configure --prefix="$PS3DEV/portlibs/ppu" --host=powerpc64-ps3-elf \
	--with-freetype-exec-prefix="$PS3DEV/portlibs/ppu" \
	--with-sdl-exec-prefix="$PS3DEV/portlibs/ppu" \
	--without-x \
	--disable-sdltest \
    	|| { exit 1; }

make && make install || { exit 1; }
