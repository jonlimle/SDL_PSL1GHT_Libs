wget --continue http://www.ferzkopp.net/Software/SDL_gfx-2.0/SDL_gfx-2.0.22.tar.gz || { exit 1; }

tar xfvz ./SDL_gfx-2.0.22.tar.gz || { exit 1; }

cd SDL_gfx-2.0.22 || { exit 1; }

./configure --prefix="$SDL_INSTALL_PATH" --host=powerpc64-ps3-elf \
	--without-x \
	--disable-sdltest \
    	|| { exit 1; }

aclocal_kluge='am__aclocal_m4_deps='
make $aclocal_kluge && make $aclocal_kluge install || { exit 1; }
