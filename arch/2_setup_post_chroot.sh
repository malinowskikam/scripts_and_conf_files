#!/bin/bash

set -e
. .env

echo "---Setting time"
ln -sf $TIMEZONE /etc/localtime
hwclock --systohc

echo "---Setting locale"
sed -i "s/#$LOCALE/$LOCALE/g" /etc/locale.gen
locale-gen
echo "LANG=$LOCALE" > /etc/locale.conf
echo "KEYMAP=$KEYBOARD_LAYOUT" > /etc/vconsole.conf

echo "---Setting hostname"
echo "$HOSTNAME" > /etc/hostname

echo "---Enable trim timer"
systemctl enable fstrim.timer
