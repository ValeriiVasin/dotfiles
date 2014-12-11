#!/usr/bin/env sh
if [ ! -d  "$HOME/dotfiles" ]; then
  git clone git@github.com:ValeriiVasin/dotfiles.git
fi;
sh $HOME/dotfiles/init.sh
