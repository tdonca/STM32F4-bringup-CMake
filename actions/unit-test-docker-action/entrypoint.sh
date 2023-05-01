#!/bin/bash

# Unit tests entrypoint

echo "Starting with a clean build environment"
rm -r $BUILD_WORKSPACE/test/build

echo "Initialize CMake configuration:"
cmake -S $BUILD_WORKSPACE/test/. -B $BUILD_WORKSPACE/test/build/

echo "Build project:"
cmake --build $BUILD_WORKSPACE/test/build

echo "Run tests:"
cd $BUILD_WORKSPACE/test/build && ctest --output-on-failure