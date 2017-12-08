#!/usr/bin/env bash

function _shared_bootstrap() {
  for file in $HOME/dotfiles/system/*; do
      [ -r "$file" ] && . $file
  done
  unset file

  GIT_PS1_SHOWDIRTYSTATE=true
  PS1='\[\033[1;30m\][\t] \[\033[01;32m\]\u\[\033[00m\]:\[\033[01;33m\]\w\[\033[00m\]\[\033[01;31m\]$(__git_ps1 " {%s}")\[\033[00m\]\$ '
}

function _osx_bootstrap() {
  # This loads RVM
  # [[ -s "$HOME/.rvm/scripts/rvm" ]] && . $HOME/.rvm/scripts/rvm

  # Bash completion
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi

  # add ssh identities for Sierra+
  ssh-add -K $(find ~/.ssh -name 'id_rsa*' -not -name '*pub')
}

function _linux_bootstrap() {
  # Special boostrap for server
  true; # no-op for now
}

# Private env variables
case "$OSTYPE" in
  # OSX
  darwin*)
    _osx_bootstrap;
    ;;
  linux*)
    _linux_bootstrap;
  ;;
esac

_shared_bootstrap;

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
