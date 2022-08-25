#!/bin/sh
set -e
. ./config.sh

# echo "sysroot:$SYSROOT"
cd $PROJECTROOT
mkdir -p "$SYSROOT"

for PROJECT in $SYSTEM_HEADER_PROJECTS; do
  (cd $PROJECT && DESTDIR="$SYSROOT" $MAKE install-headers)
done

cd $SCRIPTROOT