#!/bin/bash

set -e

echo "firefox
discord
steam
keepassxc
vlc
qbittorrent
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
" | pacman -Sy --needed -

systemctl enable bluetooth.service
systemctl enable NetworkManager.service
systemctl enable docker.service
