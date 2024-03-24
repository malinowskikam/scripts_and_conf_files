set -e

loadkeys pl
setfont ter-132b

PLATFORM_SIZE="$(cat /sys/firmware/efi/fw_platform_size)"
if [ "$PLATFORM_SIZE" -ne 64 ]; then
    echo "This is not a 64-bit UEFI system. Exiting."
    exit 1
fi

#Connect to wifi
# todo

timedatectl

https://unix.stackexchange.com/questions/477488/connect-to-wifi-from-command-line-on-linux-systems-through-the-iwd-wireless-dae