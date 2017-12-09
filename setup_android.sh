#!/bin/sh
export NO_SUDO=true
export CONFIGURATION=Release
export PATH=$PATH:/build

apt-get install -y openjdk-8-jdk make lsb-release \
    autoconf autotools-dev automake clang \
    libtool libzip4 vim-common \
    g++ cmake

cd /tmp
git clone https://github.com/xamarin/xamarin-android
cd xamarin-android
git checkout bd18b365ad6b5fb1ae6223943fae9227977251a7
make prepare
make
make install

rm /tmp/xamarin-android -R
rm /root/android-archives/ -R
rm /root/android-toolchain/sdk/docs -R
rm /root/android-toolchain/sdk/emulator -R
rm /root/android-toolchain/sdk/platforms/android-15 -R
rm /root/android-toolchain/sdk/platforms/android-16 -R
rm /root/android-toolchain/sdk/platforms/android-17 -R
rm /root/android-toolchain/sdk/platforms/android-18 -R
rm /root/android-toolchain/sdk/platforms/android-19 -R
rm /root/android-toolchain/sdk/platforms/android-20 -R

rm /root/android-toolchain/sdk/platforms/android-22 -R
rm /root/android-toolchain/sdk/platforms/android-23 -R
rm /root/android-toolchain/sdk/platforms/android-24 -R
rm /root/android-toolchain/sdk/platforms/android-25 -R
rm /root/android-toolchain/sdk/system-images/android-21 -R
rm /usr/share/dotnet/sdk/NuGetFallbackFolder -R
