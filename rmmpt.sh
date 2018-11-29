#!/usr/bin/env bash

set -o errexit
set -o pipefail

list_of_dirs=("/epdata0" "/epdata1" "/epdata2" "/epdata10" "/epdata11" "/epdata12" "/hathidata0" "/search_thesaurus_edc")

for i in "${list_of_dirs[@]}"; do
   echo deleting and unmounting $i...
   sed -i.bak '\| $i|d' /etc/fstab
   umount $i
   rm -rf $i
done
