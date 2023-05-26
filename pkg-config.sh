#!/bin/bash
# SPDX-License-Identifier: Apache-2.0

. functions

download "https://pkg-config.freedesktop.org/releases/pkg-config-0.29.2.tar.gz" "6fc69c01688c9458a57eb9a1664c9aba372ccda420a02bf4429fe610e7e7d591"
cd build
rm -rf pkg-config-*
tar xf ../download/pkg-config-*.tar.gz
cd pkg-config-*
./configure --prefix="$prefix" --with-internal-glib
$MAKE install
