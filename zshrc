ZSH=$HOME/.zsh
ZSH_THEME="best"

# prompt theme
if [ ! "$ZSH_THEME" = ""  ]; then
  source "$ZSH/themes/$ZSH_THEME.zsh-theme"
fi

# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# completion
autoload -U compinit
compinit

# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc
export CLICOLOR=1

# history settings
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Enable extended globbing
setopt extendedglob

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

# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

# ensure dotfiles bin directory is loaded first
export PATH="$HOME/.bin:/usr/local/bin:$PATH"

export DEFAULT_USER=bruno
# mkdir .git/safe in the root of repositories you trust
export PATH=".git/safe/../../bin:$PATH"
export PATH=$HOME/.bin:$PATH
# recommended by brew doctor
export PATH=/usr/local/bin:$PATH
export PATH=./node_modules/.bin:$PATH
export PATH=$PATH:/usr/local/lib/node_modules
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export CDPATH=.:$HOME/Documents/gb

# aliases
[ -d "$ZSH/aliases" ] && source "$ZSH/aliases/aliases.zsh"

source $(brew --prefix nvm)/nvm.sh
