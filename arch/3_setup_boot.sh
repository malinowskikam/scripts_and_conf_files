#!/bin/bash

set -e

echo "---Install systemd-boot"
bootctl install

echo "---Create boot entry"
echo "title Arch
linux /vmlinuz-linux
initrd /intel-ucode.img
initrd /initramfs-linux.img
options root=PARTUUID=$(blkid -s PARTUUID -o value /dev/nvme0n1p3) rw nvidia-drm.modeset=1
" > /boot/loader/entries/arch.conf
