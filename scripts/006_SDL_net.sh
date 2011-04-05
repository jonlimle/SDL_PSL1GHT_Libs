#latest release (1.2.7) doesn't compile against SDL 1.3
#cloning will fail if there is already a cloned repo - don't bork
hg clone http://hg.libsdl.org/SDL_net/

cd SDL_net || { exit 1; }

#let's hope your stars & autotools verions are aligned
./autogen.sh

#this is seems like a bug in (the version of) PSL1GHT/ps3toolchain
# (that I happen to have installed)
export CFLAGS="$CFLAGS -I$PSL1GHT/target/include"

./configure --prefix="$PSL1GHT/target" --host=ppc \
	--disable-sdltest \
	--with-sdl-exec-prefix="$PS3DEV/host/ppu" \
	--disable-shared \
    	|| { exit 1; }

make && make install || { exit 1; }
