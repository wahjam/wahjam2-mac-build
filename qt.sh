#!/bin/bash
. functions

download "https://download.qt.io/archive/qt/6.3/6.3.0/single/qt-everywhere-src-6.3.0.tar.xz" "cd2789cade3e865690f3c18df58ffbff8af74cc5f01faae50634c12eb52dd85b"

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
