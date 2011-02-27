wget --continue http://mikmod.raphnet.net/files/libmikmod-3.1.11.tar.gz || { exit 1; }

tar xfvz ./libmikmod-3.1.11.tar.gz || { exit 1; }

cd libmikmod-3.1.11 || { exit 1; }

cat ../patches/libmikmod-3.1.11.patch | patch -p1 || { exit 1; }

CC=ppu-gcc LD=ppu-ld NM=ppu-nm RANLIB=ppu-ranlib STRIP=ppu-strip \
    ./configure --prefix="$PSL1GHT/target" --host=ppu \
	--disable-esd --disable-dl --disable-shared \
	|| { exit 1; }

make && make install || { exit 1; }
