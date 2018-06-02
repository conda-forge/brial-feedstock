#!/bin/bash

chmod +x configure

./configure --prefix=$PREFIX --libdir=$PREFIX/lib --with-boost-libdir=$PREFIX/lib

make
make check
make install
