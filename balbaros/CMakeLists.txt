cmake_minimum_required(VERSION 3.19)
set(CMAKE_TOOLCHAIN_FILE "./toolchain-i686_64.cmake")

project(
  BalbarOS
  VERSION 0.01
)

enable_language(C)
enable_language(ASM)

add_subdirectory(kernel)