function eject
    # Define mount points to eject
    set mount_points "/Volumes/Portable"
    set ejected_any false

    for mp in $mount_points
        if test -d "$mp"
            if hdiutil eject "$mp"
                echo "✅ $mp ejected."
                set ejected_any true
            else
                echo "❌ $mp failed to eject." >&2
            end
        else
            echo "⚠️ $mp not mounted." >&2
        end
    end

    if not $ejected_any
        echo "No disks to eject."
    end
end
