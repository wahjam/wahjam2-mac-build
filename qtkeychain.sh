#!/bin/bash
# SPDX-License-Identifier: Apache-2.0

. functions

VERSION=0.14.3

download "https://github.com/frankosterfeld/qtkeychain/archive/refs/tags/$VERSION.tar.gz" "qtkeychain-v$VERSION.tar.gz" "a22c708f351431d8736a0ac5c562414f2b7bb919a6292cbca1ff7ac0849cb0a7"

cd build
rm -rf qtkeychain-*
tar xf "../download/qtkeychain-v$VERSION.tar.gz"
cd "qtkeychain-$VERSION"
cmake --install-prefix="$prefix" -S . -B . -DBUILD_WITH_QT6=on -DBUILD_TRANSLATIONS=off -DCMAKE_SKIP_RPATH=on -DCMAKE_MACOSX_RPATH=off '-DCMAKE_INSTALL_NAME_DIR=$<INSTALL_PREFIX>/lib'
make install
