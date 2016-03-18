#!/usr/bin/env bash

for file in $HOME/dotfiles/system/*; do
    [ -r "$file" ] && . $file
done
unset file

# This loads RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

GIT_PS1_SHOWDIRTYSTATE=true
PS1='\[\033[1;30m\][\t] \[\033[01;32m\]\u\[\033[00m\]:\[\033[01;33m\]\w\[\033[00m\]\[\033[01;31m\]$(__git_ps1 " {%s}")\[\033[00m\]\$ '

# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

eval $(docker-machine env default)
