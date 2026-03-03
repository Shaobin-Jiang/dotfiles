install() {
    local target_path="$1"
    local package_name="$2"
    
    stow -t "$target_path" -D "$package_name"
    mkdir -p "$target_path"
    stow -t "$target_path" "$package_name"
}

install $HOME/.config/aerospace aerospace
install $HOME/.config/fastfetch fastfetch
install $HOME/.config/fish fish
install $HOME/.config/ghostty/ ghostty
install $HOME/.config/kitty kitty
# install $HOME/.qutebrowser qutebrowser
install $HOME/.config starship
install $HOME/.config/sketchybar sketchybar
install $HOME tmux
install $HOME/.config/yazi yazi
install $HOME zsh
