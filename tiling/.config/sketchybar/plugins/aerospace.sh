#!/usr/bin/env bash

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME background.color=0xffd0eff7 \
                           label.color=0xff363636
else
    sketchybar --set $NAME background.drawing=off \
                           label.color=0xffffffff
fi
