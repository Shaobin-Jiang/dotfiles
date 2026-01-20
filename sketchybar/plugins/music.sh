#!/usr/bin/env bash

INFO_FILE="/tmp/music_info.txt"

# Check if Music app is running
if ! pgrep -x Music > /dev/null; then 
    sketchybar --set music drawing=off
    exit 0
fi

# Ensure monitor is running
if ! pgrep -f music_monitor_file > /dev/null; then
    ~/.config/sketchybar/scripts/music_monitor_file > /dev/null 2>&1 &
    sleep 1
fi

# Read info file
if [[ -f "$INFO_FILE" ]] && [[ -s "$INFO_FILE" ]]; then
    TITLE=$(grep "^title:" "$INFO_FILE" | cut -d: -f2- | xargs -0)
    ARTIST=$(grep "^artist:" "$INFO_FILE" | cut -d: -f2- | xargs -0)
    STATE=$(grep "^state:" "$INFO_FILE" | cut -d: -f2- | xargs)
    
    if [[ -n "$TITLE" ]]; then
        ICON=""
        [[ "$STATE" == "Paused" ]] && ICON=""
        
        [[ ${#TITLE} -gt 25 ]] && TITLE="${TITLE:0:25}..."
        [[ ${#ARTIST} -gt 15 ]] && ARTIST="${ARTIST:0:15}..."
        
        LABEL="${TITLE} - ${ARTIST}"
        [[ -z "$ARTIST" ]] && LABEL="$TITLE"
        
        # For some reason, if I do not add something at the end, the text would be cropped.
        sketchybar --set music icon="$ICON" label="  $LABEL 1" drawing=on
    else
        sketchybar --set music drawing=off
    fi
else
    sketchybar --set music drawing=off
fi
