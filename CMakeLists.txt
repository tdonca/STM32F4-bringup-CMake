cmake_minimum_required(VERSION 3.16)
project(STM32F4-bringup LANGUAGES ASM C CXX)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

set(CMAKE_C_EXTENSIONS ON) # ON means -std=gnu11
set(CMAKE_C_STANDARD_REQUIRED ON) 
set(CMAKE_CXX_EXTENSIONS ON) # ON means -std=gnu++17
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Project-specific compiler options
add_compile_options(
  -Wall # all compiler warnings
  -Wextra # extra warnings
  -Wconversion # warn for conversion
  -Wsign-conversion # warn for sign conversion
  -g3 # extra debug defuntions including macros
  -Og # optimization for debug
)

# Project-specific compiler definitions
add_compile_definitions(
  DEBUG
  USE_HAL_DRIVER
)

add_executable(Application 
  Core/Startup/startup_stm32f439zitx.s
  Core/Src/main.c
  Core/Src/eth.c
  Core/Src/gpio.c
  Core/Src/stm32f4xx_hal_msp.c
  Core/Src/stm32f4xx_it.c
  Core/Src/syscalls.c
  Core/Src/sysmem.c
  Core/Src/system_stm32f4xx.c
  Core/Src/usart.c
  Core/Src/usb_otg.c
  Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.c
  Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma_ex.c
  Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma.c
  Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_eth.c
  Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_exti.c
  Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ex.c
  Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ramfunc.c
  Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash.c
  Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_gpio.c
  Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pcd_ex.c
  Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pcd.c
  Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr_ex.c
  Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.c
  Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc_ex.c
  Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.c
  Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim_ex.c
  Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim.c
  Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_uart.c
  Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.c
  Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_usb.c
)

# Project-specific include directories
target_include_directories(Application PRIVATE
  Core/Inc 
  Drivers/CMSIS/Include 
  Drivers/CMSIS/Device/ST/STM32F4xx/Include 
  Drivers/STM32F4xx_HAL_Driver/Inc 
  Drivers/STM32F4xx_HAL_Driver/Inc/Legacy
)

set_target_properties(Application PROPERTIES
    SUFFIX .elf
)

# Project-specific linker options
target_link_options(Application PRIVATE
  -T${CMAKE_SOURCE_DIR}/STM32F439ZITX_FLASH.ld # linker script for specific MCU model
  LINKER:-Map,${CMAKE_CURRENT_BINARY_DIR}/Application.map # generate map file output
  LINKER:--print-memory-usage # print out memory usage after linking
)

