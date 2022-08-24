# see https://cmake.org/cmake/help/book/mastering-cmake/chapter/Cross%20Compiling%20With%20CMake.html

set(CMAKE_SYSTEM_NAME BalbarOS)

set(CMAKE_C_COMPILER "/home/kutay/opt/cross/bin/i686-elf-gcc")
set(CMAKE_CXX_COMPILER "/home/kutay/opt/cross/bin/i686-elf-g++")
set(CMAKE_ASM_COMPILER "/home/kutay/opt/cross/bin/i686-elf-gcc")

set(CMAKE_C_COMPILER_WORKS 1) # otherwise cmake tries to compile a test program and fails miserably
set(CMAKE_CXX_COMPILER_WORKS 1) # otherwise cmake tries to compile a test program and fails miserably
set(CMAKE_ASM_COMPILER_WORKS 1) # otherwise cmake tries to compile a test program and fails miserably

set(CMAKE_FIND_ROOT_PATH ~/opt/cross/bin/)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)