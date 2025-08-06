-- This piece of code is not actually used in sketchybar setup.
--
-- It is more of a guidance to finding the correct name of the processes / menu
-- bar items.


-- Listing all processes
tell application "System Events"
    set processList to name of every process
end tell
log processList

-- Listing the UI elements
-- Here we use ControlCenter as an example
tell application "System Events"
    tell process "ControlCenter"
        set menuBarItems to every menu bar item of menu bar 1
        repeat with itemRef in menuBarItems
            log (description of itemRef) & " - " & (name of itemRef)
        end repeat
    end tell
end tell
