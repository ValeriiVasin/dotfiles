#!/usr/bin/env bash
cd $HOME;
if [ ! -d  "$HOME/dotfiles" ]; then
  git clone git@github.com:ValeriiVasin/dotfiles.git
else
  cd $HOME/dotfiles;
  git pull origin master;
fi;
. $HOME/dotfiles/init.bash
