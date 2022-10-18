#!/bin/bash
. functions

download "https://github.com/libsndfile/libsamplerate/releases/download/0.2.2/libsamplerate-0.2.2.tar.xz" "3258da280511d24b49d6b08615bbe824d0cacc9842b0e4caf11c52cf2b043893"

cd build
rm -rf libsamplerate-*
tar xf ../download/libsamplerate-*.tar.xz
cd libsamplerate-*
./configure --prefix="$prefix"
$MAKE install
