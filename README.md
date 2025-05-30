# Blade OS Version 25 (Gloomy Summit)
A Debian based Linux distro that allows things to get done quickly.

[![monthly-build-x86_64](https://github.com/Blade-OS/os/actions/workflows/build_monthly.yml/badge.svg)](https://github.com/Blade-OS/os/actions/workflows/build_monthly.yml)

# How to build
Builds are usually automated via GitHub actions. However, if you want to build it yourself, you'll need to install some dependencies first.

```apt-get install -y live-build squashfs-tools syslinux-common syslinux-utils xorriso git curl```

Build for x64 - `build`
Build for arm64 - `build_arm`
