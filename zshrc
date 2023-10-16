# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
# initialize plygins statically with ~/.zsh_pkugins.txt
antidote load

source ~/powerlevel10k/powerlevel10k.zsh-theme

eval "$(direnv hook zsh)"

export LC_ALL=en_US.UTF-8

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
