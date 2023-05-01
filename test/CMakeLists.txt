# Top-level CMakeLists file for Unit Tests

cmake_minimum_required(VERSION 3.14)
project(unit_tests LANGUAGES C CXX)

# GoogleTest requires at least C++14
set(CMAKE_CXX_STANDARD 17) #? clarify
set(CMAKE_CXX_STANDARD_REQUIRED ON) #? clarify
set(CMAKE_CXX_EXTENSIONS ON) #? clarify

set(GNU_UNIT_TEST_OPTIONS   
    #-m32 # Add 32bit compile options to get closer to embedded context
    --coverage # enable gcov unit test code coverage analysis
)

add_compile_options(
    ${GNU_UNIT_TEST_OPTIONS}
)

add_link_options(
    ${GNU_UNIT_TEST_OPTIONS}
)

# Unit Test Framework
enable_testing()
include(FetchContent)
FetchContent_Declare(
  googletest
  URL https://github.com/google/googletest/archive/03597a01ee50ed33e9dfd640b249b4be3799d395.zip
)
# For Windows: Prevent overriding the parent project's compiler/linker settings
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

add_subdirectory(Utils)
#...
