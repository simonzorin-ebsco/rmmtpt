#!/usr/bin/env bash
#Version .6

set -o errexit
set -o pipefail

E_BADARGS=85

if [ ! -n "$1" ]
then
  echo "Usage: `basename $0` filepath1 filepath2 etc."
  exit $E_BADARGS
fi

echo

index=1          # Reset count.

echo "Listing mount points to unmount and corresponding directories to delete:"
for filepath in "$@"
do
  echo "Arg #$index = $filepath"
  let "index+=1"
  sed -i -e "/\/${filepath}/d" /etc/fstab || true
  umount $filepath || true
done

exit 0