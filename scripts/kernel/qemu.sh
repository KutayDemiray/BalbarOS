#!/bin/sh
set -e
. ./iso.sh

cd $PROJECTROOT
qemu-system-$($SCRIPTROOT/target-triplet-to-arch.sh $HOST) -cdrom balbaros.iso
