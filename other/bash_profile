#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

###############
# => Functions
################
function cd() {
  builtin cd $1 && ls
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
