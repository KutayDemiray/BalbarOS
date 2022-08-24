# Assemble boot
set(BOOT_SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/boot.s")
#set(BOOT_DEPS "${CMAKE_CURRENT_SOURCE_DIR}/print.nasm")
set(BOOT_BIN "${CMAKE_CURRENT_BINARY_DIR}/boot.o")

set(CMAKE_C)

add_custom_command(
    OUTPUT ${BOOT_BIN}
    COMMAND i686-elf-gcc -std=gnu99 -ffreestanding -g -c ${BOOT_SOURCE} -o ${BOOT_BIN}
    COMMENT "Assembling ${BOOT_SOURCE}: i686-elf-gcc -std=gnu99 -ffreestanding -g -c ${BOOT_SOURCE} -o ${BOOT_BIN}"
    DEPENDS ${BOOT_SOURCE} ${BOOT_DEPS}
)

add_custom_target(
    boot ALL
    # COMMAND echo "Test print for assembling boot"
    DEPENDS ${BOOT_BIN} ${BOOT_SOURCE} # ${BOOT_DEPS}
    VERBATIM
)

# # TODO: if/else check for architecture
# add_custom_command(
#     OUTPUT ${BOOT_BIN}
#     COMMAND nasm -fbin ${BOOT_SOURCE} -o ${BOOT_BIN}
#     COMMENT "Assembling ${BOOT_SOURCE}: nasm -fbin ${BOOT_SOURCE} -o ${BOOT_BIN}"
#     DEPENDS ${BOOT_SOURCE} ${BOOT_DEPS}
# )

# add_custom_target(
#     boot ALL
#     # COMMAND echo "Test print for assembling boot"
#     DEPENDS ${BOOT_BIN} ${BOOT_SOURCE} ${BOOT_DEPS}
#     VERBATIM
# )