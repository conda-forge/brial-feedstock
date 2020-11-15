#!/bin/bash

# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* .

chmod +x configure

sed -i.bak 's|-fdebug-prefix-map.*||g' "${PREFIX}/lib/pkgconfig/m4ri.pc"
rm  "${PREFIX}/lib/pkgconfig/m4ri.pc.bak"

# Get rid of any `.la`
find $PREFIX/lib -name '*.la' -delete

./configure --prefix=$PREFIX --libdir=$PREFIX/lib --with-boost=$PREFIX --with-boost-libdir=$PREFIX/lib --disable-static

make -j${CPU_COUNT}
make check -j${CPU_COUNT}
make install
