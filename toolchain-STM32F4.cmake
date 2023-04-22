# Usage: cmake -S . -B build/ -DCMAKE_TOOLCHAIN_FILE=toolchain-STM32F4.cmake

# Specify cross-compilation project
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_VERSION Cortex-M4-STM32F4)
set(CMAKE_SYSTEM_PROCESSOR arm)

# Define toolchain
set(CMAKE_C_COMPILER arm-none-eabi-gcc)
set(CMAKE_CXX_COMPILER arm-none-eabi-g++)

set(ARM_OPTIONS 
  -mcpu=cortex-m4
  -mfpu=fpv4-sp-d16 
  -mfloat-abi=hard 
  -mthumb
  --specs=nano.specs
)

set(CMAKE_ASM_FLAGS
  "-x assembler-with-cpp"
)

add_compile_options(
    ${ARM_OPTIONS}
    -fmessage-length=0
    -funsigned-char
    -ffunction-sections
    -fdata-sections
    -fstack-usage
    #-fcyclomatic-complexity
    -MMD
    -MP
)

add_compile_definitions(
    STM32F439xx
    USE_FULL_ASSERT
    OS_USE_TRACE_SEMIHOSTING_STDOUT
    OS_USE_SEMIHOSTING
)

add_link_options(
    ${ARM_OPTIONS}
    --specs=nosys.specs
    -u_printf_float
    -u_scanf_float
    #-nostartfiles
    LINKER:--gc-sections
    LINKER:--build-id
)

# Search paths
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

