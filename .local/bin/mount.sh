#!/bin/sh

set -e
set -o pipefail

SUDO() {
	tmp="$(mktemp)"
	chmod +x "$tmp"
	echo -e '#!/bin/sh\necho "$(echo | dmenu -P -p "Password" || kill -9 $PPID)"' > "$tmp"
	SUDO_ASKPASS="$tmp" sudo -A $@
	rm "$tmp"
}

partitions="$(SUDO fdisk -l | grep "^\(/dev/sd\|Device\)")"
selected="$(echo "$partitions" | dmenu -l 100)"
device="$(echo "$selected" | awk '{print $1}')"

case "$selected" in
	*"FAT32"*) options="-o gid=$(whoami),uid=$(whoami)" ;;
esac

mount_point="$(echo | dmenu -p "Mount point" -it "/mnt")"

err="$(SUDO mount $device $mount_point $options 2>&1)"

[ -z "$err" ] || {
	echo | dmenu -p "Failed to mount drive: $(echo "$err" | head -n 1)"
	exit 1
}

echo | dmenu -p "Drive mounted" || true
