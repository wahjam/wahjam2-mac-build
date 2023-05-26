#!/bin/bash
# SPDX-License-Identifier: Apache-2.0

. functions

download "http://files.portaudio.com/archives/pa_stable_v190700_20210406.tgz" "47efbf42c77c19a05d22e627d42873e991ec0c1357219c0d74ce6a2948cb2def"

cd build
rm -rf portaudio
tar xf ../download/pa_stable_*.tgz
cd portaudio
./configure --prefix="$prefix" --disable-mac-universal
$MAKE install
