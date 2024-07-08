#!/bin/bash

set -e

echo "
ffmpeg
openssh
git
neovim
bluez
networkmanager
docker
tmux
sudo
rsync
strace
less
jq
curl
wget
zip
unzip
tree
neofetch
wireguard-tools
man-db
man-pages
x264
x265
xvidcore
" | pacman -Sy --needed -


systemctl enable docker.service
