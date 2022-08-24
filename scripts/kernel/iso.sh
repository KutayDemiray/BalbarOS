#!/bin/sh
set -e
. ./build.sh

mkdir -p isodir
mkdir -p isodir/boot
mkdir -p isodir/boot/grub

cp sysroot/boot/balbaros.kernel isodir/boot/balbaros.kernel
cat > isodir/boot/grub/grub.cfg << EOF
menuentry "BalbarOS" {
	multiboot /boot/balbaros.kernel
}
EOF
grub-mkrescue -o balbaros.iso isodir
