#!/bin/bash

PATTERN="$1"
TARGET="$2"

window_id=$(aerospace list-windows --all | awk '/Yazi:/ {print $1}')

if [ -n "$window_id" ]; then
    aerospace focus --window-id "$window_id"
else
    # Use applescript to also quit kitty completely when exiting yazi
    # Note that using a simple 'quit app "kitty"' would throw a 128 error
    # Which is why we are using a complicated check syntax here
    kitty -e bash -c $'yazi ~; osascript -e \'try\' -e \'quit app "kitty"\' -e \'on error errMsg number errNum\' -e \'if errNum ≠ -128 then\' -e \'display dialog "Error: " & errMsg\' -e \'end if\' -e \'end try\''
fi
