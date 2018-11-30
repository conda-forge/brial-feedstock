#!/bin/bash

chmod +x configure

export CPPFLAGS="$CPPFLAGS -I$PREFIX/include"

# Get rid of any `.la`
find $PREFIX/lib -name '*.la' -delete

./configure --prefix=$PREFIX --libdir=$PREFIX/lib --with-boost=$PREFIX --with-boost-libdir=$PREFIX/lib

make
make check
make install
