#!/bin/bash
# SPDX-License-Identifier: Apache-2.0

. functions

download "https://github.com/ninja-build/ninja/releases/download/v1.11.1/ninja-mac.zip" "482ecb23c59ae3d4f158029112de172dd96bb0e97549c4b1ca32d8fad11f873e"

cd build/
rm -f ninja
unzip ../download/ninja-mac.zip
cp ninja "$prefix/bin/"
