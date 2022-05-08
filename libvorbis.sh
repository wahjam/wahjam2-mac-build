#!/bin/bash
. functions

download "http://downloads.xiph.org/releases/vorbis/libvorbis-1.3.7.tar.gz" "0e982409a9c3fc82ee06e08205b1355e5c6aa4c36bca58146ef399621b0ce5ab"

cd build
rm -rf libvorbis-*
tar xf ../download/libvorbis-*.tar.gz
cd libvorbis-*
./configure --prefix="$prefix"
$MAKE install
