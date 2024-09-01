#!/bin/bash

set -e

device_mount_pairs=(
  "/dev/by-id/usb-Seagate_BUP_Slim_00000000NAB55K1W-0:0:/media/briggs"
  # "/dev/disk/by-partuuid/XXXXXXXXX:/media/laura"
  "/dev/disk/by-partuuid/290416cf-01:/media/cooper"
  "/dev/disk/by-partuuid/620fd55d-0338-41a2-9f16-229e2ea58d17:/media/bob1"
  "/dev/disk/by-partuuid/e1c21d1c-6d29-4d51-add2-017ab16a1759:/media/bob2"
  "/dev/disk/by-partuuid/585beea5-05b6-4aca-8f31-27d99500e8e4:/media/bob3"
)

is_mounted() {
  mountpoint -q "$1"
}

VC_PASSWORD=""

needs_mounting=false
for pair in "${device_mount_pairs[@]}"; do
  IFS=':' read -r device mount_point <<< "$pair"
  if ! is_mounted "$mount_point"; then
    needs_mounting=true
    break
  fi
done

if $needs_mounting; then
  read -s -p "Password: " VC_PASSWORD
  echo
fi

for i in "${!device_mount_pairs[@]}"; do
  IFS=':' read -r device mount_point <<< "${device_mount_pairs[i]}"
  if is_mounted "$mount_point"; then
    echo "$mount_point is already mounted."
  else
    sudo mkdir -p $mount_point
    echo "Mounting $device at $mount_point"
    echo "$VC_PASSWORD" | veracrypt --text --mount "$device" "$mount_point" --pim 0 --keyfiles "" --protect-hidden no --stdin --non-interactive
  fi
done

unset VC_PASSWORD
