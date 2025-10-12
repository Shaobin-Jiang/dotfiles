function clc
    clear
    if string match -q "*tmux*" $TERM; and not test -z "$TMUX"
        tmux clear-history
    end
    fastfetch
end
