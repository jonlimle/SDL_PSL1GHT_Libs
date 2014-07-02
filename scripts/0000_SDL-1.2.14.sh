wget --continue http://www.libsdl.org/release/SDL-1.2.14.tar.gz || {exit 1;}

tar xfvz ./SDL-1.2.14.tar.gz || { exit 1; }

cd SDL-1.2.14 || { exit 1; }

patch -p1 -i ../patches/SDL-1.2.14.patch

./configure --prefix="$SDL_INSTALL_PATH" --host=powerpc64-ps3-elf \
	--enable-joystick=yes --enable-audio=yes --enable-threads=yes \
	--disable-sdltest \
    	|| { exit 1; }

make && make install || { exit 1; }
