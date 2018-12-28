export LSCOLORS='exfxcxdxbxegedabagacad'
# enable colored output from ls, etc. on FreeBSD-based systems
export CLICOLOR=true

# load antibody plugins
source ~/.zsh_plugins.sh

# history settings
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000

# If set, this option causes globs which do not match a file to result in an error without running the command. If unset, the command is run with the un-expanded glob. I do a lot of math at the command line and have gotten used to doing things like “5*7” without quoting. Just what I'm used to, but nice that I can customize it.
unsetopt NOMATCH

# VI mode
bindkey -v
bindkey "^F" vi-cmd-mode

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# handy keybindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word

autoload -U zmv

export DEFAULT_USER=brunoazevedo

# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

[ -f ~/.asdf/asdf.sh ] && source ~/.asdf/asdf.sh
eval "$(direnv hook zsh)"

export PATH="/usr/local/bin:$HOME/.bin:$PATH"
