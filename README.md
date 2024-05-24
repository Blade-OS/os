# Blade OS (Version 24)
A simple Debian based Linux distro that gets things set up easily.

[![monthly-build-x86_64](https://github.com/Blade-OS/os/actions/workflows/build_monthly.yml/badge.svg)](https://github.com/Blade-OS/os/actions/workflows/build_monthly.yml)

# How to build
Builds are usually automated via GitHub actions. However, if you want to build it yourself, you'll need to install some dependencies first.

```apt-get install -y live-build squashfs-tools syslinux-common syslinux-utils xorriso git curl```

Build Desktop Edition - `build`
Build Server Edition - `build_server`
