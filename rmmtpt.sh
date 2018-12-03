#!/usr/bin/env bash

set -o errexit
set -o pipefail

E_BADARGS=85

if [ ! -n "$1" ]
then
  echo "Usage: `basename $0` argument1 argument2 etc."
  exit $E_BADARGS
fi  

echo

index=1          # Reset count.

echo "Listing mount points to unmount and corresponding directories to delete:"
for arg in "$@"
do
  echo "Arg #$index = $arg"
  let "index+=1"
  cp /etc/fstab /etc/fstab.bak
  sed -i -e "/\/${arg}/d" /etc/fstab || true
  umount $arg || true
done            

exit 0
