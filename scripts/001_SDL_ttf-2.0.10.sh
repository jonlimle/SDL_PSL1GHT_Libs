wget --continue http://www.libsdl.org/projects/SDL_ttf/release/SDL_ttf-2.0.10.tar.gz || { exit 1; }

tar xfvz ./SDL_ttf-2.0.10.tar.gz || { exit 1; }

cd SDL_ttf-2.0.10 || { exit 1; }

cat ../patches/SDL_ttf-2.0.10.patch | patch -p1 || { exit 1; }

./configure --prefix="$SDL_INSTALL_PATH" --host=powerpc64-ps3-elf \
	--with-freetype-exec-prefix="$PS3DEV/portlibs/ppu" \
	--without-x \
	--disable-sdltest \
    	|| { exit 1; }

make && make install || { exit 1; }
