# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions direnv)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias reload-zsh="source ~/.zshrc"
alias edit-zsh="nvim ~/.zshrc"


# VIM
alias v="/opt/homebrew/bin/nvim"

alias cl='clear'

alias lg='lazygit'

alias cat=bat

# starship themes
alias li='export STARSHIP_CONFIG=~/.config/starship/starship_latte.toml'
alias da='export STARSHIP_CONFIG=~/.config/starship/starship_mocha.toml'
export STARSHIP_CONFIG=~/.config/starship/starship_latte.toml

# Languages
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
# Permite que node utilice más memoria para compilar.
export NODE_OPTIONS="--max-old-space-size=4096"

# Created by `pipx` on 2024-06-25 13:47:56
export PATH="$PATH:/Users/fran/.local/bin"


# EZA
# https://github.com/eza-community/eza
alias l='eza -l --icons --git -a'
alias lm='eza -l --icons --git -a --sort=modified'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='eza --tree --level=2 --long --icons --git -a'

# YAZI
y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# FZF
# https://github.com/junegunn/fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--height 40% --tmux 40% --layout reverse --border --inline-info'

# LAZIGIT
# https://github.com/jesseduffield/lazygit
export XDG_CONFIG_HOME="$HOME/.config"

# Navigation
fcd() { cd "$(fd --type d | fzf)" && l; }
f() { echo "$(fzf)" | pbcopy }
fv() { nvim "$(fzf --tmux 100%,50% --preview 'bat -n --color=always {}')" }

# using ripgrep combined with preview
# find-in-file - usage: fif <searchTerm>
fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

# docker ps
fdps() { docker ps --format 'table {{.Names}}\t{{.Ports}}\t{{.Status}}' | fzf }

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# zsh-vi-mode plugin
# https://github.com/jeffreytse/zsh-vi-mode
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
# The plugin will auto execute this zvm_after_init function
# Since the default initialization mode, this plugin will overwrite the previous key 
# bindings, this causes the key bindings of other plugins (i.e. fzf, zsh-autocomplete,
# etc.) to fail.
# See https://github.com/jeffreytse/zsh-vi-mode?tab=readme-ov-file#execute-extra-commands
function zvm_after_init() {
  source <(fzf --zsh)
}

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/fran/.lmstudio/bin"

# To enable command history in iex
export ERL_AFLAGS="-kernel shell_history enabled"
