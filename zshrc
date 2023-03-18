export LSCOLORS='exfxcxdxbxegedabagacad'
# enable colored output from ls, etc. on FreeBSD-based systems
export CLICOLOR=true


# history settings
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000

# If set, this option causes globs which do not match a file to result in an error without running the command. If unset, the command is run with the un-expanded glob. I do a lot of math at the command line and have gotten used to doing things like “5*7” without quoting. Just what I'm used to, but nice that I can customize it.
unsetopt NOMATCH

export DEFAULT_USER=brunoazevedo

export PATH="$HOME/.bin:$PATH"

eval "$(/opt/homebrew/bin/brew shellenv)"
source /opt/homebrew/opt/asdf/libexec/asdf.sh

# load antidote plugins
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load

eval "$(direnv hook zsh)"

export LC_ALL=en_US.UTF-8
