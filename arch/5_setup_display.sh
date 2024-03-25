#!/bin/bash

set -e

echo "xorg-server
xorg-xinit
xorg-xkill
xterm
plasma-meta
plasma-workspace
ark
dolphin
konsole
sddm
" | pacman -Sy --needed -

systemctl enable sddm.service
