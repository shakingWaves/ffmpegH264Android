#!/bin/bash
export TEMPDIR="D:/tmp"
export NDKROOT="D:/Android/sdk/ndk-bundle"
PREBUILT=$NDKROOT/toolchains/arm-linux-androideabi-4.9/prebuilt/windows-x86_64
SYSROOT=$NDKROOT/platforms/android-9/arch-arm
./configure --target-os=linux \
			--arch=arm \
			--cpu=armv7-a \
			--cross-prefix=$PREBUILT/bin/arm-linux-androideabi- \
			--nm=$PREBUILT/bin/arm-linux-androideabi-nm \
			--sysroot=$SYSROOT \
			--disable-ffmpeg \
			--disable-ffplay \
			--disable-ffserver \
			--disable-ffprobe \
			--enable-asm \
			--enable-neon \
			--disable-everything \
			--enable-decoder=h264 \
			--enable-parser=h264 \
			--enable-demuxer=h264 \
			--enable-protocol=file
