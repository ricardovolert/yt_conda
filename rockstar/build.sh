#!/bin/bash
make lib
mkdir $PREFIX/lib
cp librockstar.so $PREFIX/lib/
