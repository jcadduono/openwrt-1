#!/bin/bash

image="$(find bin/targets/ -name "*-factory.img")"
addr=192.168.1.1

abort() {
	[ "$1" ] && echo "Error: $*"
	exit 1
}

[ -f "$image" ] || abort "Image '$image' not found!"

echo "...flashing factory image..."
busybox tftp -p -b 512 -l "$image" "$addr" || abort "Flash failed!"

echo "Flash complete!"
