# Usage: cmake -S . -B build/ -DCMAKE_TOOLCHAIN_FILE=toolchain-STM32F4.cmake

# Specify cross-compilation project
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_VERSION Cortex-M4-STM32F4)
set(CMAKE_SYSTEM_PROCESSOR arm)

# Define toolchain
set(CMAKE_C_COMPILER arm-none-eabi-gcc)
set(CMAKE_CXX_COMPILER arm-none-eabi-g++)

# Common gcc options for STM32F4
set(ARM_OPTIONS   
  -mcpu=cortex-m4
  -mfpu=fpv4-sp-d16 
  -mfloat-abi=hard 
  -mthumb 
  --specs=nano.specs
)

# Common compile definitions for STM32F4
add_compile_definitions(
    STM32F439xx
)

# Common assembly options
set(CMAKE_ASM_FLAGS
  "-x assembler-with-cpp"
)

# Common compiler options
add_compile_options(
    ${ARM_OPTIONS}
    # -ffunction-sections # recommended, but do not prematurely optimize
    # -fdata-sections # recommended, but do not prematurely optimize
    -fstack-usage
    -MMD
    -MP
)

# Common linker options
add_link_options(
  ${ARM_OPTIONS}
  --specs=nosys.specs
  -static # prevent any dynamic linking with shared libraries
  # LINKER:--gc-sections # recommended, but do not prematurely optimize
)

# Search paths
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

