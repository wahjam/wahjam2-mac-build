# macOS build scripts for Wahjam2

These scripts create a macOS build environment for compiling
[Wahjam2](https://github.com/wahjam/wahjam2).

1. Install the Xcode from the App Store.

2. Build all dependencies::

    $ ./pkg-config.sh && ./cmake.sh && ./qt.sh && ./libogg.sh && ./libvorbis.sh && ./portaudio.sh

The build output is installed to the root/ directory.

Compilation takes place in the build/ directory. Build errors can be
investigated in that directory.

3. Install the meson build system::

    $ pip3 install --user meson

4. Build Wahjam2::

    $ export PATH=path/to/root/bin:~/Library/Python/3.8/bin:$PATH
    $ cd wahjam2
    $ meson setup build
    $ meson compile -C build

This software is made available under the Apache License 2.0.

This software is maintained by Stefan Hajnoczi <stefanha@jammr.net>.
