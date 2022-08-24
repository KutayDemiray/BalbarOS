# This script follows steps in https://wiki.osdev.org/GCC_Cross-Compiler

# Preparation
export PREFIX="$HOME/opt/cross"
export TARGET=i686-elf
export PATH="$PREFIX/bin:$PATH"
echo "Preparation done"

# Binutils
cd $HOME/src
 
mkdir build-binutils
cd build-binutils
../binutils-2.34/configure --target=$TARGET --prefix="$PREFIX" --with-sysroot --disable-nls --disable-werror
make
make install
echo "Binutils done"

# GCC (this part will take a while)
cd $HOME/src
 
# The $PREFIX/bin dir _must_ be in the PATH. We did that above.
which -- $TARGET-as || echo $TARGET-as is not in the PATH

mkdir build-gcc
cd build-gcc
../gcc-9.4.0/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --enable-languages=c,c++ --without-headers
make all-gcc
echo "all-gcc done"
make all-target-libgcc
echo "all-target-libgcc done"
make install-gcc
echo "install-gcc done"
make install-target-libgcc
echo "install-target-libgcc done"

echo "Cross compiler successfully (?) built in $PREFIX"
