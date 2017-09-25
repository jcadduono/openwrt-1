#!/bin/bash

abort() {
	[ "$1" ] && echo "Error: $*"
	exit 1
}

echo "...update main source..."
git fetch || abort "Could not fetch OpenWRT changes"
git rebase || abort "Rebase of local changes on new changes failed, apply them manually"

echo "...update feeds..."
scripts/feeds update -a || abort "Feeds update failed"

echo "...install feeds..."
scripts/feeds install -a || abort "Feeds install failed"
