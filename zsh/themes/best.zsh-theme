# modify the prompt to contain git branch name if applicable
git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    echo " %{$fg[yellow]%}${ref#refs/heads/}%{$reset_color%}"
  fi
}

setopt promptsubst

export PS1='${SSH_CONNECTION+"%{$fg_bold[cyan]%}%n@%m:"}%{$fg[blue]%}%c%{$reset_color%}$(git_prompt_info) %# '
