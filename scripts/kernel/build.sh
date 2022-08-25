#!/bin/sh
MAKEPROCESSES=1
while getopts j: flag
do
    case "${flag}" in
        j) MAKEPROCESSES=${OPTARG};;
    esac
done

set -e
. ./headers.sh

cd $PROJECTROOT

for PROJECT in $PROJECTS; do
  (cd $PROJECT && DESTDIR="$SYSROOT" $MAKE -j${MAKEPROCESSES} install)
done

cd $SCRIPTROOT