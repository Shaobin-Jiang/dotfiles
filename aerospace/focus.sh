#!/bin/bash

PATTERN="$1"
TARGET="$2"

window_id=$(aerospace list-windows --all | awk "/^[0-9]+[ ]+\|[ ]+$PATTERN/ {print \$1}")

if [ -n "$window_id" ]; then
    aerospace focus --window-id "$window_id"
else
    open "$TARGET"
fi
