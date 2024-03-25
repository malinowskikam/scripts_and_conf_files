#!/bin/bash

set -e

KEYBOARD_LAYOUT=pl
TERMINAL_FONT=ter-122b

WIFI_DEVICE=wlan0
WIFI_SSID=xxx
WIFI_PASS=xxx

DISK_SFDISK_TEMPLATE=partitions-laptop.sfdisk
DISK_DEVICE=/dev/nvme0n1
DISK_EFI_PARTITION=/dev/nvme0n1p3
DISK_BOOT_PARTITION=/dev/nvme0n1p3

USER_NAME=xxx
USER_PASSWORD=xxx

echo "Setting keyboard layout to $KEYBOARD_LAYOUT"
loadkeys $KEYBOARD_LAYOUT

echo "Setting terminal forn to $TERMINAL_FONT"
setfont $TERMINAL_FONT

echo "Checking for UEFI"
PLATFORM_SIZE="$(cat /sys/firmware/efi/fw_platform_size)"
if [ "$PLATFORM_SIZE" -ne 64 ]; then
    echo "This is not a 64-bit UEFI system. Exiting."
    exit 1
fi

echo "Connecting to WIFI $WIFI_SSID on $WIFI_DEVICE"
# todo

echo "Formatting $DISK_DEVICE"


#timedatectl

https://unix.stackexchange.com/questions/477488/connect-to-wifi-from-command-line-on-linux-systems-through-the-iwd-wireless-dae
