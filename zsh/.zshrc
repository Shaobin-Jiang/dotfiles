export EDITOR=nvim

export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
export HOMEBREW_INSTALL_FROM_API=1
export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"

alias blog='cd $HOME/Codes/blog/'
alias clc='clear; fastfetch'
alias condainit='eval "$(/opt/homebrew/Caskroom/miniconda/base/bin/conda shell.zsh hook 2> /dev/null)"'
alias fontsize='kitty @ set-font-size' # requires "allow_remote_control yes" in kitty
alias grep='grep --color=auto'
alias imshow='kitten icat'
alias ls='ls --color=auto'
alias ml='conda activate ml'
alias poetryinit='eval "$(poetry env activate)"'
alias python='python3'
alias rmdsstore='rm $HOME/**/.DS_STORE'
alias uvv='source ./.venv/bin/activate'

# for my neovim tutorials
# alias nv='XDG_CONFIG_HOME=$HOME/nvim-config/ XDG_DATA_HOME=$HOME/nvim-config/data nvim'

function nh() {
	nohup $* >/dev/null 2>&1 &
}

function yazi() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

clc

eval "$(starship init zsh)"
