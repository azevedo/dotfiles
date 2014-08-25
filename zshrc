# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="ys"
# ZSH_THEME="pure"

alias zshrc='vim ~/.zshrc'

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
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
HIST_STAMPS="dd.mm.yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-extras archlinux colorize dirpersist extract rails zeus zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

#######################################
####  USER CONFIGURATIONS
#######################################

# "command not found" hook
[ -r /etc/profile.d/cnf.sh ] && . /etc/profile.d/cnf.sh

# Ignore completion functions for commands you don’t have:
zstyle ':completion:*:functions' ignored-patterns '_*'

# cd will never select the parent directory (e.g.: cd ../<TAB>):
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# Activate the bash-style comments
setopt interactivecomments

# Calls ls after changing path
function chpwd() {
  emulate -L zsh
  ls
}

# Enables the direnv extension. It's going to allow direnv to execute before
# every prompt command and adjust the environment.
eval "$(direnv hook zsh)"

export EDITOR=vim

export DEFAULT_USER=bruno
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=./node_modules/.bin:$PATH
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export CDPATH=$HOME/Documents/gb
