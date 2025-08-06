#!/bin/bash

PATTERN="$1"
TARGET="$2"

window_id=$(aerospace list-windows --all | awk '/Yazi:/ {print $1}')

if [ -n "$window_id" ]; then
    aerospace focus --window-id "$window_id"
else
    kitty --single-instance -d ~ -e yazi
fi
