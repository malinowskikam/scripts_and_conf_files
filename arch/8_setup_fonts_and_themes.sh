#!/bin/bash

set -e

echo "
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

