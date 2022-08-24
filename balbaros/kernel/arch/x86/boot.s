// this is more or less a copy https://wiki.osdev.org/User:Zesterer/Bare_Bones

.extern kernel_main // this means this is the main function of kernel.c

.global start // required by the linker

// grub stuff
.set MB_MAGIC, 0x1BADB002 // detects kernel location
.set MB_FLAGS, (1 << 0) | (1 << 1) // tells GRUB to load modules on page boundaries and provide a memory map
.set MB_CHECKSUM, (0 - (MB_MAGIC + MB_FLAGS))

.section .multiboot // this section will contain the multiboot header
    .align 4 // following data is aligned to a multiple of 4 bytes
    .long MB_MAGIC
    .long MB_FLAGS
    .long MB_CHECKSUM

.section .bss // this section is the stack for C code (4 KB for now)
    .align 16
    stack_bottom:
        .skip 4096 // may change later
    stack_top:

.section .text // this section stores actual boot code
    start: // this is the first code that gets run in the kernel
        mov $stack_top, %esp
        call kernel_main
        hang: // the C code should never return, but if it does, do the following
            cli // disable CPU interrupts
            hlt // halt the CPU
            jmp hang // infinite loop (if the two lines above didn't work for some reason)
            