#!/bin/bash

export CFLAGS="$CFLAGS -m$ARCH"
export LDLAGS="$LDLAGS -m$ARCH"

cmake -DBUILD_SHARED_LIBS=1 -DCMAKE_INSTALL_PREFIX=$PREFIX .

make && make install
