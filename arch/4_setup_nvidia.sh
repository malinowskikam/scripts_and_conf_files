#!/bin/bash

set -e

echo "---Instaling nvidia drivers"
pacman -Sy nvidia-dkms libglvnd nvidia-utils opencl-nvidia lib32-libglvnd lib32-nvidia-utils lib32-opencl-nvidia nvidia-settings

echo "---Add nvidia modules to mkinitcpio"
sed -i 's/^MODULES=()/MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)/g' /etc/mkinitcpio.conf

echo "---Add pacman hook for nvidia"
mkdir -p /etc/pacman.d/hooks
echo "[Trigger]
Operation=Install
Operation=Updrade
Operation=Remove
Type=Package
Target=nvidia

[Action]
Depends=mkinitcpio
When=PostTransaction
Exec=/usr/bin/mkinitcpio -P
" > /etc/pacman.d/hooks/nvidia.hook
