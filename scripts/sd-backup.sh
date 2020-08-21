#!/bin/bash

# Backup content of sd-card.
#
# usage:
#   sd-backup.sh [device]
#
# By default "/dev/mmcblk0" used as device.
#
# Restore image to sd-card:
#   gunzip --stdout sd-card-backup-20200822-001618.img.gz | sudo dd bs=4M status=progress of=/dev/mmcblk0
#
# More details at https://www.raspberrypi.org/documentation/linux/filesystem/backup.md

input="$1"
output="sd-card-backup-$(date +%Y%m%d-%H%M%S).img.gz"

[[ ! -z "${input}" ]] || input="/dev/mmcblk0"

echo "input=\"${input}\""
echo "output=\"${output}\""

# Execute dd
dd bs=4M if="${input}" status=progress | gzip > "${output}"

# Result execution of dd
retval=${PIPESTATUS[0]}

if [ ${retval} -eq 0 ]; then
  echo "Done"
else
  echo "Failure (code=${retval})"
  rm "${output}"
fi
