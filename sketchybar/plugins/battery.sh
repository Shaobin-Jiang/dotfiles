#!/bin/sh

# The $NAME variable is passed from sketchybar and holds the name of
# the item invoking this script:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

PERCENTAGE=$(pmset -g batt | grep -Eo '[0-9]+%' | head -n1 | tr -d '%')
STATUS=$(pmset -g batt | awk -F'; *' 'NR==2{print $2}') # charging / discharging / charged

case $STATUS in
  charging)    color='0xff53abf2' ;;
  discharging) color='0xffffffff' ;;
  charged)     color='0xff53f2ab' ;;
  *)           color='0xffffffff' ;;
esac

if [ $PERCENTAGE -ge 100 ]; then p_char=󰁹
elif [ $PERCENTAGE -ge 90 ]; then p_char=󰂂
elif [ $PERCENTAGE -ge 80 ]; then p_char=󰂁
elif [ $PERCENTAGE -ge 70 ]; then p_char=󰂀
elif [ $PERCENTAGE -ge 60 ]; then p_char=󰁿
elif [ $PERCENTAGE -ge 50 ]; then p_char=󰁾
elif [ $PERCENTAGE -ge 40 ]; then p_char=󰁽
elif [ $PERCENTAGE -ge 30 ]; then p_char=󰁼
elif [ $PERCENTAGE -ge 20 ]; then p_char=󰁻
elif [ $PERCENTAGE -ge 10 ]; then p_char=󰁺
else                              p_char=󰂎
fi

sketchybar --set battery_status icon=$p_char \
                                icon.color=$color \
           --set battery_percentage label="$PERCENTAGE%"

