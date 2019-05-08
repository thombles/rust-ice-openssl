#!/bin/bash
set -eu

# Set this to location of Android NDK
NDK=/Users/tk/Library/Android/sdk/ndk-bundle/
# (Tested on NDK 19.2.5345600, installed via Android Studio SDK Manager)

# Set this to your platform - probably "darwin-x86_64", "windows-x86_64", "linux-x86_64"
HOST_PLATFORM=darwin-x86_64

echo "Using Android NDK at $NDK for $HOST_PLATFORM"

export AR="$NDK/toolchains/llvm/prebuilt/${HOST_PLATFORM}/bin/aarch64-linux-android-ar"
export CC="$NDK/toolchains/llvm/prebuilt/${HOST_PLATFORM}/bin/aarch64-linux-android21-clang"
export CARGO_TARGET_AARCH64_LINUX_ANDROID_LINKER="${CC}"
export RUST_BACKTRACE=1
cargo build --target aarch64-linux-android
