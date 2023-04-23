#!/bin/bash

echo "Starting with a clean build environment"
rm -r build

echo "Initialize CMake configuration:"
cmake -S . -B build/ -DCMAKE_TOOLCHAIN_FILE=toolchain-STM32F4.cmake

echo "Build project:"
cmake --build build
