#!/bin/sh

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

if [ "$SENDER" = "front_app_switched" ]; then
  sketchybar --set "$NAME" label="$INFO"
fi

if printf '%s' "$INFO" | LC_ALL=C grep -q '[^ -~]'; then
    sketchybar --set "$NAME" label.font="手札体-简:Bold:14.0"
else
    sketchybar --set "$NAME" label.font="m6x11plus:Regular:20.0"
fi
