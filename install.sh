#!/usr/bin/env sh
cd $HOME;
if [ ! -d  "$HOME/dotfiles" ]; then
  git clone git@github.com:ValeriiVasin/dotfiles.git
else
  cd $HOME/dotfiles;
  git pull origin master;
fi;
sh $HOME/dotfiles/init.sh
