#!/bin/bash

chmod +x configure

export CPPFLAGS="$CPPFLAGS -I$PREFIX/include"
export CFLAGS=$(echo "${CFLAGS}" | sed 's|-fdebug-prefix-map.*||g')
export CXXFLAGS=$(echo "${CXXFLAGS}" | sed 's|-fdebug-prefix-map.*||g')

# Get rid of any `.la`
find $PREFIX/lib -name '*.la' -delete

./configure --prefix=$PREFIX --libdir=$PREFIX/lib --with-boost=$PREFIX --with-boost-libdir=$PREFIX/lib

make
make check
make install
