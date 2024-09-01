#!/bin/bash

device_mount_pairs=(
  "/dev/sda:/media/briggs"
  # "/dev/sdb1:/media/laura"
  "/dev/sdc1:/media/cooper"
  "/dev/sdd1:/media/bob1"
  "/dev/sdd2:/media/bob2"
  "/dev/sdd3:/media/bob3"
)

is_mounted() {
  mountpoint -q "$1"
}

for pair in "${device_mount_pairs[@]}"; do
  IFS=':' read -r device mount_point <<< "$pair"
  if is_mounted "$mount_point"; then
    echo "Unmounting $mount_point"
    sudo veracrypt --text --dismount "$mount_point" --non-interactive
  else
    echo "$mount_point is not mounted."
  fi
done
