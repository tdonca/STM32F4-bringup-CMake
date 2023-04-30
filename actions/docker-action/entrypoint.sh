#!/bin/sh -l

# echo "Hello $1"
# time=$(date)
# echo "time=$time" >> $GITHUB_OUTPUT

echo "BUILD_WORKSPACE=" $BUILD_WORKSPACE " seen?"

# TODO: verify env vars and error if they are not set

echo "Starting with a clean build environment"
rm -r $BUILD_WORKSPACE/build

echo "Initialize CMake configuration:"
cmake -S $BUILD_WORKSPACE/. -B $BUILD_WORKSPACE/build/ -DCMAKE_TOOLCHAIN_FILE=$BUILD_WORKSPACE/toolchain-STM32F4.cmake

echo "Build project:"
cmake --build $BUILD_WORKSPACE/build
