add_subdirectory(arch/x86)

# Compile kernel.c
add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/kernel.o
    COMMAND i686-elf-gcc -std=gnu99 -ffreestanding -g -c ${CMAKE_CURRENT_SOURCE_DIR}/kernel.c -o ${CMAKE_CURRENT_BINARY_DIR}/kernel.o
    COMMENT "Compiling kernel.c: i686-elf-gcc -std=gnu99 -ffreestanding -g -c kernel.c -o ${CMAKE_CURRENT_BINARY_DIR}/kernel.o"
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/kernel.c
)

add_custom_target(
    kernel ALL
    # COMMAND echo "Test print for assembling boot"
    DEPENDS kernel.c
    VERBATIM
)

# target_compile_options(kernel PUBLIC "-std=gnu99;-ffreestanding;-g")
# add_dependencies(kernel boot) # commented because we will use our custom linker script

# Link kernel.o and boot.o
add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/kernel/kernel.elf
    COMMAND i686-elf-gcc -ffreestanding -nostdlib -g
            -T ${CMAKE_CURRENT_SOURCE_DIR}/linker/boot_linker.ld
            ${CMAKE_CURRENT_BINARY_DIR}/arch/x86/boot.o ${CMAKE_CURRENT_BINARY_DIR}/kernel.o
            -o ${CMAKE_CURRENT_BINARY_DIR}/kernel/kernel.elf
            -lgcc
    COMMENT "Linking boot.o and kernel.o: i686-elf-gcc -ffreestanding -nostdlib -g -T linker.ld start.o kernel.o -o mykernel.elf -lgcc"
    DEPENDS boot kernel "${CMAKE_CURRENT_SOURCE_DIR}/linker/boot_linker.ld" "${CMAKE_CURRENT_BINARY_DIR}/arch/x86/boot.o" "${CMAKE_CURRENT_BINARY_DIR}/kernel.o"
)

add_custom_target(
    linked_kernel ALL
    # COMMAND echo "Test print for assembling boot"
    DEPENDS boot kernel ${CMAKE_CURRENT_BINARY_DIR}/arch/x86/boot.o ${CMAKE_CURRENT_BINARY_DIR}/kernel.o ${CMAKE_CURRENT_SOURCE_DIR}/linker/boot_linker.ld ${CMAKE_CURRENT_BINARY_DIR}/kernel/kernel.elf
    VERBATIM
)