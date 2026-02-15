# Make sure fish is in /etc/shells before calling chsh

if status is-login
    /opt/homebrew/bin/brew shellenv | source
end

set fish_greeting
set -x EDITOR nvim
set -x XDG_CONFIG_HOME $HOME/.config

set -x HOMEBREW_BREW_GIT_REMOTE https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git
set -x HOMEBREW_CORE_GIT_REMOTE https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git
set -x HOMEBREW_INSTALL_FROM_API 1
set -x HOMEBREW_API_DOMAIN https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api
set -x HOMEBREW_BOTTLE_DOMAIN https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles

set -x PUB_HOSTED_URL "https://pub.flutter-io.cn"
set -x FLUTTER_STORAGE_BASE_URL "https://storage.flutter-io.cn"

fish_add_path -pP $HOME/.cargo/bin
fish_add_path -pP /opt/flutter/bin
fish_add_path -aP $HOME/.orbstack/bin

abbr --add adbls "adb shell ls /sdcard"
abbr --add adbps "adb push /sdcard/"
abbr --add adbpl --set-cursor "adb pull % /sdcard/"

if not string match -q "xterm-256color" $TERM
    clc
end

starship init fish | source

if command -v tmux &>/dev/null; and status is-interactive; and not string match -q "*tmux*" $TERM; and test -z "$TMUX"
    tmux new-session -A -s main
end
