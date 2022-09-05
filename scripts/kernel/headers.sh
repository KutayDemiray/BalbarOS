#!/bin/bash
set -e
. ./config.sh

DOTESTS=0
while getopts :j:t: flag
do
    case "${flag}" in
        j) MAKEPROCESSES=${OPTARG};;
        t) DOTESTS=1;;
    esac
done

if [[ DOTESTS -eq 1 ]]
then
  SYSTEM_HEADER_PROJECTS="libc test kernel"
  PROJECTS="libc test kernel"
fi

# echo "sysroot:$SYSROOT"
cd $PROJECTROOT
mkdir -p "$SYSROOT"

for PROJECT in $SYSTEM_HEADER_PROJECTS; do
  (cd $PROJECT && DESTDIR="$SYSROOT" $MAKE install-headers)
done

cd $SCRIPTROOT