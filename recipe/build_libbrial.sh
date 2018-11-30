#!/bin/bash

chmod +x configure

export CPPFLAGS="$CPPFLAGS -I$PREFIX/include"
sed -i.bak 's|-fdebug-prefix-map.*||g' "${PREFIX}/lib/pkgconfig/m4ri.pc"

# Get rid of any `.la`
find $PREFIX/lib -name '*.la' -delete

./configure --prefix=$PREFIX --libdir=$PREFIX/lib --with-boost=$PREFIX --with-boost-libdir=$PREFIX/lib

make
make check
make install
