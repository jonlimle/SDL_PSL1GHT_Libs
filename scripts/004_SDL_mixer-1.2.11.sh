wget --continue http://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-1.2.11.tar.gz || { exit 1; }

tar xfvz ./SDL_mixer-1.2.11.tar.gz || { exit 1; }

cd SDL_mixer-1.2.11 || { exit 1; }

cat ../patches/SDL_mixer-1.2.11.patch | patch -p1 || { exit 1; }

./configure --prefix="$PS3DEV/ppu" --host=ppu \
	--disable-sdltest \
	--with-sdl-exec-prefix="$PS3DEV/ppu" \
	--disable-shared \
	--disable-music-cmd \
	--disable-music-ogg-shared \
	--disable-music-mod \
	--disable-music-mp3 \
    	|| { exit 1; }

make && make install || { exit 1; }
