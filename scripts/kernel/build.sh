#!/bin/bash
MAKEPROCESSES=1
DOTESTS=0
while getopts :t:j: flag
do
    case "${flag}" in
        j) MAKEPROCESSES=${OPTARG};;
        t) DOTESTS=1;;
    esac
done
TRUE=1

if (( DOTESTS == 1 ))
then
  set -e
  . ./headers.sh -t
  
  SYSTEM_HEADER_PROJECTS="libc test kernel"
  PROJECTS="libc test kernel"
  DOTESTS=1
else
  set -e
  . ./headers.sh
fi

cd $PROJECTROOT
echo ""
echo "Building targets ${PROJECTS}"
echo ""

for PROJECT in $PROJECTS; do
echo "=========================="
echo "Building target ${PROJECT}"
echo "=========================="
  (cd $PROJECT && DESTDIR="$SYSROOT" $MAKE -j${MAKEPROCESSES} install)
  echo ""
done

cd $SCRIPTROOT