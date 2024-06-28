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
neofetch
wireguard-tools
man-db
man-pages
terminus-font
inter-font
cantarell-fonts
ttf-bitstream-vera
ttf-caladea
ttf-carlito
ttf-cascadia-code
ttf-croscore
ttf-dejavu
ttf-droid
ttf-fira-code
ttf-fira-mono
ttf-fira-sans
ttf-inconsolata
ttf-liberation
ttf-opensans
ttf-roboto
ttf-ubuntu-font-family
x264
x265
xvidcore
" | pacman -Sy --needed -


systemctl enable docker.service
