wget --continue ftp://ftp.remotesensing.org/pub/libtiff/tiff-3.9.4.tar.gz || { exit 1; }

tar xfvz ./tiff-3.9.4.tar.gz || { exit 1; }

cd tiff-3.9.4 || { exit 1; }

cat ../patches/tiff-3.9.4.patch | patch -p1 || { exit 1; }

./configure --prefix="$PS3DEV/portlibs/ppu" --host=ppu --disable-shared \
    	|| { exit 1; }

make && make install || { exit 1; }
