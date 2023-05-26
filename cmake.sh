#!/bin/bash
# SPDX-License-Identifier: Apache-2.0

. functions

download "https://github.com/Kitware/CMake/releases/download/v3.23.1/cmake-3.23.1.tar.gz" "33fd10a8ec687a4d0d5b42473f10459bb92b3ae7def2b745dc10b192760869f3"
cd build
rm -rf cmake-*
tar xf ../download/cmake-*.tar.gz
cd cmake-*
./bootstrap --prefix="$prefix"
$MAKE install
