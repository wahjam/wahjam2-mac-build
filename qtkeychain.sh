#!/bin/bash
. functions

VERSION=0.13.2

download "https://github.com/frankosterfeld/qtkeychain/archive/refs/tags/v$VERSION.tar.gz" "qtkeychain-v$VERSION.tar.gz" "20beeb32de7c4eb0af9039b21e18370faf847ac8697ab3045906076afbc4caa5"

cd build
rm -rf qtkeychain-*
tar xf "../download/qtkeychain-v$VERSION.tar.gz"
cd "qtkeychain-$VERSION"
cmake --install-prefix="$prefix" -S . -B . -DBUILD_WITH_QT6=on -DBUILD_TRANSLATIONS=off
make install
