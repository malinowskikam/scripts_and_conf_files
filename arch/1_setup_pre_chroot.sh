#!/bin/bash

set -e
. .env

echo "---Setting keyboard layout to $KEYBOARD_LAYOUT"
loadkeys $KEYBOARD_LAYOUT

echo "---Setting terminal forn to $TERMINAL_FONT"
setfont $TERMINAL_FONT

echo "---Checking for UEFI"
PLATFORM_SIZE="$(cat /sys/firmware/efi/fw_platform_size)"
if [ "$PLATFORM_SIZE" -ne 64 ]; then
    echo "This is not a 64-bit UEFI system. Exiting."
    exit 1
fi

echo "---Connecting to WIFI $WIFI_SSID on $WIFI_DEVICE"
iwctl --passphrase $WIFI_PASS station $WIFI_DEVICE connect $WIFI_SSID

echo "---Partitioning $DISK_DEVICE"
sfdisk $DISK_DEVICE < $DISK_SFDISK_TEMPLATE

echo "---Formatting $DISK_DEVICE"
mkfs.fat -F32 $DISK_EFI_PARTITION
mkswap $DISK_SWAP_PARTITION
swapon $DISK_SWAP_PARTITION
mkfs.ext4 $DISK_ROOT_PARTITION

echo "---Mounting $DISK_DEVICE"
mount $DISK_ROOT_PARTITION /mnt
mkdir /mnt/boot
mount $DISK_EFI_PARTITION /mnt/boot

echo "---Instaling rankmirrors"
pacman -Sy --noconfirm pacman-contrib

echo "---Ranking mirrors"
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
rankmirrors -n 6 /etc/pacman.d/mirrorlist.backup

echo "---Instaling arch"
pacstrap -K /mnt base linux linux-firmware linux-headers

echo "---Generating fstab"
genfstab -U /mnt >> /mnt/etc/fstab
