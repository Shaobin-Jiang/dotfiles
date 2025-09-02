#!/usr/bin/env bash

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh

WINDOW_COUNT=$(aerospace list-windows --workspace "$1" 2>/dev/null | wc -l)

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME background.color=0xffd0eff7 \
                           label.color=0xff363636
elif [ "$WINDOW_COUNT" -gt 0 ]; then
    sketchybar --set $NAME background.color=0x77d0eff7 \
                           label.color=0xddffffff
else
    sketchybar --set $NAME background.drawing=off \
                           label.color=0xffffffff
fi
