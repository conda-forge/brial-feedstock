#!/bin/bash

chmod +x configure

export CPPFLAGS="$CPPFLAGS -I$PREFIX/include"

./configure --prefix=$PREFIX --libdir=$PREFIX/lib --with-boost=$PREFIX --with-boost-libdir=$PREFIX/lib

make
make check
make install
