#!/bin/bash

set -e

echo "
plasma-meta
ark
dolphin
konsole
wl-clipboard
xorg-xwayland
sddm
" | pacman -Sy --needed -

systemctl enable sddm.service
systemctl enable bluetooth.service
systemctl enable NetworkManager.service
