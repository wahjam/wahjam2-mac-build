#!/bin/bash
# SPDX-License-Identifier: Apache-2.0

. functions

# CMAKE_OSX_ARCHITECTURES is set for universal binaries below and it does not
# work together with -arch compiler flags set by ./functions above.
unset CFLAGS
unset CXXFLAGS
unset LDFLAGS

VERSION_MAJ=6
VERSION_MIN=5
VERSION_PATCH=3
VERSION=$VERSION_MAJ.$VERSION_MIN.$VERSION_PATCH
download "https://download.qt.io/archive/qt/$VERSION_MAJ.$VERSION_MIN/$VERSION/single/qt-everywhere-src-$VERSION.tar.xz" "7cda4d119aad27a3887329cfc285f2aba5da85601212bcb0aea27bd6b7b544cb"

cd build
rm -rf qt-everywhere-src-*
tar xf ../download/qt-everywhere-src-$VERSION.tar.xz
cd qt-everywhere-src-$VERSION

# Pass in CMake options to disable rpath since -no-rpath currently doesn't work:
# https://bugreports.qt.io/browse/QTBUG-109820

./configure -prefix "$prefix" \
	    -shared \
	    -no-static \
	    -release \
	    -force-debug-info \
	    -separate-debug-info \
	    -framework \
	    -appstore-compliant \
	    -system-zlib \
	    -qt-libpng \
	    -qt-libjpeg \
	    -qt-freetype \
	    -qt-pcre \
	    -nomake tests \
	    -nomake examples \
	    -no-rpath \
	    -pkg-config \
	    -no-dbus \
	    -no-glib \
	    -submodules qtbase,qtdeclarative,qtsvg \
	    -no-widgets \
	    -skip qt3d \
	    -skip qtactiveqt \
	    -skip qtandroidextras \
	    -skip qtcharts \
	    -skip qtconnectivity \
	    -skip qtdatavis3d \
	    -skip qtgamepad \
	    -skip qtgraphicaleffects \
	    -skip qtlocation \
	    -skip qtlottie \
	    -skip qtmultimedia \
	    -skip qtnetworkauth \
	    -skip qtpurchasing \
	    -skip qtquick3d \
	    -skip qtquickcontrols \
	    -skip qtquicktimeline \
	    -skip qtremoteobjects \
	    -skip qtscript \
	    -skip qtscxml \
	    -skip qtsensors \
	    -skip qtserialbus \
	    -skip qtserialport \
	    -skip qtspeech \
	    -skip qtvirtualkeyboard \
	    -skip qtwayland \
	    -skip qtwebchannel \
	    -skip qtwebengine \
	    -skip qtwebglplugin \
	    -skip qtwebsockets \
	    -skip qtwebview \
	    -skip qtwinextras \
	    -skip qtx11extras \
	    -skip qtxmlpatterns \
	    -- \
	    -DCMAKE_OSX_ARCHITECTURES="x86_64;arm64" \
	    -DCMAKE_SKIP_RPATH=ON \
	    -DCMAKE_MACOSX_RPATH=OFF \
	    '-DCMAKE_INSTALL_NAME_DIR=$<INSTALL_PREFIX>/lib'
cmake --build . # add --parallel for speed, but it seems to be unreliable :(
cmake --install .
