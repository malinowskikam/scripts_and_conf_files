#!/bin/bash

set -e

echo "
firefox
discord
steam
keepassxc
vlc
qbittorrent
" | pacman -Sy --needed -
