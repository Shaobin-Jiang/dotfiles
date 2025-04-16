tell application "System Events"
    tell process "Dock"
        set dockIcons to UI elements of list 1
        
        repeat with iconItem in dockIcons
            if name of iconItem is "AlDente" then
                perform action "AXPress" of iconItem
                exit repeat
            end if
        end repeat
    end tell
end tell
