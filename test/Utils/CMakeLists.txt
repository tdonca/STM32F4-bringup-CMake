# CMakeLists file that defines each test suite executable

message("CMAKE PROJECT DIR: ${CMAKE_PROJECT_DIR}")
#################################################
add_executable(Utils_Calculator_Test
    CalculatorTest.cpp
    # Unit under test sources
    ${CMAKE_CURRENT_LIST_DIR}/../../Utils/sources/Calculator.cpp
)

target_include_directories(Utils_Calculator_Test PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/../../Utils/
)

target_link_libraries(Utils_Calculator_Test
    GTest::gtest_main
)
#################################################

include(GoogleTest)
gtest_discover_tests(Utils_Calculator_Test)
