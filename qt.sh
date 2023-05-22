#!/bin/bash
. functions

download "https://download.qt.io/archive/qt/6.5/6.5.0/single/qt-everywhere-src-6.5.0.tar.xz" "dba376e110e53895c7c827eea389dc12aa9c45862cd197d2f0d37ee472baf0b0"

cd build
rm -rf qt-everywhere-*
tar xf ../download/qt-everywhere-*.tar.xz
cd qt-everywhere-*
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
	    -skip qtxmlpatterns
$MAKE install
