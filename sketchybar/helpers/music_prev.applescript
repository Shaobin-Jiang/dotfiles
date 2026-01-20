tell application "Music"
    set currentPos to player position
    
    if currentPos > 3 then
        pause
        set player position to 0
        previous track
        play
    else
        previous track
    end if
end tell
