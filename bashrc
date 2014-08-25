#ALIAS
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias desk='cd ~/Desktop'
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'
alias h='history'
alias path='echo -e ${PATH//:/\\n}'
alias vi=vim
alias svi='sudo vi'
alias vis='vim "+set si"'
alias edit='vim'
alias doc='cd ~/Documents'
alias dow='cd ~/Downloads'
alias bashrc='vim ~/.bashrc'
alias drop='cd ~/Dropbox'
alias r='rails'
alias g='git'
alias src='source ~/.bashrc'


#-------------------------------------------------------------
# Misc utilities:
#-------------------------------------------------------------
function extract()      # Handy Extract Program.
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xvjf $1     ;;
      *.tar.gz)    tar xvzf $1     ;;
      *.bz2)       bunzip2 $1      ;;
      *.rar)       unrar x $1      ;;
      *.gz)        gunzip $1       ;;
      *.tar)       tar xvf $1      ;;
      *.tbz2)      tar xvjf $1     ;;
      *.tgz)       tar xvzf $1     ;;
      *.zip)       unzip $1        ;;
      *.Z)         uncompress $1   ;;
      *.7z)        7z x $1         ;;
      *)           echo "'$1' cannot be extracted via >extract<" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}



#--------------------
# Package Management:
#--------------------

# Reflector creates a set number of the most up to date & fastest repo mirrors:
alias mirror="sudo reflector -l 12 --sort rate --save /etc/pacman.d/mirrorlist"

# Creates a list of all installed packages:
alias pkglist="comm -13 <(pacman -Qmq | sort) <(pacman -Qqe | sort) > pkglist"

# Lets you search through all available packages simply using 'pacsearch packagename':
alias pacsearch="pacman -Sl | cut -d' ' -f2 | grep "

# sudo pacman -Syu by typing pSyu (sudo must be installed and configured first):
alias update="sudo pacman -Syu"

# pacman -S by typing pS :
alias pS="sudo pacman -S"

# pacman -Rsn  ,which fully deletes packages - including dependencies & config files 
alias pdelete="sudo pacman -Rsn"

# pacman -Syy ,this forces a refresh of all package lists:
alias refresh="sudo pacman -Syy"

# remove orphans
alias porph="sudo pacman -Sc $(pacman -Qdtq)"

# deletes all but the last 2 versions of installed packages in the pacman cache
alias pcc="sudo pkgcacheclean 1"

# pacman -U ,installs package from specified location on disk,
# usually /var/cache/pacman/pkg/ following command will
# echo command to Terminal where it can be copied, have the
# file name added & used:
alias pU="echo sudo pacman -U /var/cache/pacman/pkg/-file name here-"

# yaourt -Syu by typing yaur :
alias yaur="yaourt -Syu --aur"

# yaourt -S by typing yS :
alias yS="yaourt -S"

# yaourt -Rsn , which fully deletes packages - see above :
alias ydelete="yaourt -Rsn"

complete -cf sudo

source /usr/share/git/completion/git-prompt.sh
source /usr/share/git/completion/git-completion.bash
GIT_PS1_SHOWUPSTREAM='auto'
GIT_PS1_SHOWDIRTYSTATE='auto'
GIT_PS1_SHOWSTASHSTATE='auto'
GIT_PS1_SHOWUNTRACKEDFILES='auto'
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

export EDITOR=vim

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
