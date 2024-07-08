#!/bin/bash

set -e

echo "
firefox
discord
steam
keepassxc
vlc
qbittorrent
obsidian
" | pacman -Sy --needed -
