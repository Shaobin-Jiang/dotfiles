#!/usr/bin/env bash

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace-mode.sh

case $MODE in
    main)
        sketchybar --set $NAME label.drawing=off \
                              background.drawing=off
        ;;
    service)
        sketchybar --set $NAME label=service \
                              label.drawing=on \
                              background.drawing=on \
                              background.color=0xffe712b9
        ;;
    resize)
        sketchybar --set $NAME label=resize \
                              label.drawing=on \
                              background.drawing=on \
                              background.color=0xff52990e
        ;;
    launch)
        sketchybar --set $NAME label=apps \
                              label.drawing=on \
                              background.drawing=on \
                              background.color=0xffed886b
        ;;
    cursor)
        sketchybar --set $NAME label=cursor \
                              label.drawing=on \
                              background.drawing=on \
                              background.color=0xff250abd
        ;;
    music)
        sketchybar --set $NAME label=music \
                              label.drawing=on \
                              background.drawing=on \
                              background.color=0xffea343c
        ;;
    im)
        sketchybar --set $NAME label=im \
                              label.drawing=on \
                              background.drawing=on \
                              background.color=0xffe06333
        ;;
esac
