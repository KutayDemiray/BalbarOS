# Cross Compiler
Currently, there's only one cross-compiler, which is for i686-elf architecture.

## Instructions
The instructions below closely follow [this OSDev Wiki page](https://wiki.osdev.org/GCC_Cross-Compiler).
Before starting, install all requirements listed [here](https://wiki.osdev.org/GCC_Cross-Compiler#Installing_Dependencies).

1. Get Binutils 2.34 from [here](https://ftp.gnu.org/gnu/binutils/). Extract the source code folder in the tarball to `$HOME/src`.
2. Get GCC 9.4 from [here](ftp.gnu.org/gnu/gcc/). Again, extract the source code folder in the tarball to `$HOME/src`.
    * If you want to use different versions (not recommended), you will need to edit `build_crosscompiler.sh` accordingly.
3. Run `./build_crosscompiler.sh`. The new compiler can be found at `$HOME/opt/cross/bin`.
4. Run `export PATH="$HOME/opt/cross/bin:$PATH"`. 
5. Now, the new compiler is (or should be) usable like regular GCC by just replacing `gcc` with `i686-elf-gcc`.