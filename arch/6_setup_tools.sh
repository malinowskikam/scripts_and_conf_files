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
which
curl
wget
zip
unzip
unrar
tree
neofetch
wireguard-tools
man-db
man-pages
x264
x265
xvidcore
cifs-utils
" | pacman -Sy --needed -


systemctl enable docker.service
