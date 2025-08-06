tell application "System Events"
    tell process "ControlCenter"
        set wifiIcon to first menu bar item of menu bar 1 whose description starts with "Wi‑Fi"
        
        click wifiIcon
    end tell
end tell
