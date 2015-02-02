# OS Detection
UNAME=`uname`
CURRENT_OS='Linux'
DISTRO=''

if [[ $UNAME == 'Darwin' ]]; then
  CURRENT_OS='OS X'
else
  # Must be Linux, determine distro
fi

# Load Antigen
source ~/.antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Antigen Theme
antigen bundle sindresorhus/pure

# Adds several git aliases and increase the completion function provided by zsh
antigen bundle git

# Heroku Autocomplete
antigen bundle heroku

# Helper for extracting different types of archives
antigen bundle extract

antigen bundle tmux

# Manage complex tmux sessions easily
antigen bundle tmuxinator

# ZSH port of Fish shell's history search feature.
antigen bundle zsh-users/zsh-history-substring-search

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Jump around your most used directories, based on 'frecency'
antigen bundle rupa/z

# OS specific plugins
if [[ $CURRENT_OS == 'OS X' ]]; then
    antigen bundle brew
    antigen bundle brew-cask
    antigen bundle gem
elif [[ $CURRENT_OS == 'Linux' ]]; then
    # None so far...
fi

antigen bundle azevedo-252/zsh-files

antigen apply

# history settings
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

# Allow [ or ] whereever you want
unsetopt nomatch

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode

# handy keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

export DEFAULT_USER=bruno

export CDPATH=.:$HOME/Documents/gb

source $(brew --prefix nvm)/nvm.sh
