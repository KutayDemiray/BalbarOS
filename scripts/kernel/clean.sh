#!/bin/sh
set -e
. ./config.sh

cd $PROJECTROOT

for PROJECT in $PROJECTS; do
  (cd $PROJECT && $MAKE clean)
done

rm -rf sysroot
rm -rf isodir
rm -rf balbaros.iso

cd $SCRIPTROOT