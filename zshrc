# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby bundler z)

source $ZSH/oh-my-zsh.sh
#
# aliases
alias g="git status"
alias gh="git hist"
alias gpu="git gpu"
alias grb="git rebase"
alias gdc="git diff --cached"
alias gst="git stash"
alias git-remote-cleanup="git remote prune origin"
alias gbam="git branch --merged master | grep -v master | xargs git branch -d"

alias sagi="sudo apt-get install"

alias npmi="npm install --save-dev"

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export TERM=xterm-256color

# Customize to your needs... (like custom PATH)
source ~/.zshrc.user

# Make directory and change into it
function mc {
  mkdir $1
  cd $1
}

# vi mode (oh-my-zsh is overwriting something here, so we stuff it in the back)
bindkey -v
bindkey ' ' magic-space
bindkey "^?" backward-delete-char # deletes past insert mode
bindkey '^R' history-incremental-search-backward # retain the emacs search
bindkey "^P" up-line-or-history
bindkey "^N" down-line-or-history
# some bad habits without vi mode...
bindkey '^[[1~' beginning-of-line #
bindkey '^[[4~' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[[5~' up-line-or-history
bindkey '^[[6~' down-line-or-history
# more vim like attitude
bindkey '^X' edit-command-line
bindkey -M vicmd 'u' undo
bindkey -M vicmd '^R' redo
bindkey -M vicmd 'Y' vi-yank-eol
bindkey -M vicmd 'H' beginning-of-line
bindkey -M vicmd 'L' end-of-line

