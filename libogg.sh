#!/bin/bash
# SPDX-License-Identifier: Apache-2.0

. functions

download "http://downloads.xiph.org/releases/ogg/libogg-1.3.5.tar.gz" "0eb4b4b9420a0f51db142ba3f9c64b333f826532dc0f48c6410ae51f4799b664"

cd build
rm -rf libogg-*
tar xf ../download/libogg-*.tar.gz
cd libogg-*
./configure --prefix="$prefix"
$MAKE install
