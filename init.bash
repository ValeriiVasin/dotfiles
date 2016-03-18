#!/usr/bin/env bash

CURRENT_FOLDER="$(CDPATH= cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# use exports
. $CURRENT_FOLDER/system/exports.bash

function _init_sublime() {
  echo "Linking sublime packages"
  cd "$HOME/Library/Application Support/Sublime Text 3"
  rm -r Installed\ Packages
  rm -r Packages
  ln -s "$DROPBOX_FOLDER/Shared/SublimeText3/Installed Packages"
  ln -s "$DROPBOX_FOLDER/Shared/SublimeText3/Packages"
}

function _init_npm() {
  . $DOTFILES_FOLDER/init/npm.bash
}

function _init_atom() {
  . $DOTFILES_FOLDER/init/atom.bash
}

function _init_brew() {
  . $DOTFILES_FOLDER/init/brew.bash
}

function _init_links() {
  echo "Linking files to home folder..."
  for file in $(find $DOTFILES_FOLDER/home -type f); do
    [ -r "$file" ] && ln -sf $file "$HOME/$(basename $file)"
  done
}

function _init_rvm() {
  # RVM + ruby
  echo 'Installing rvm, ruby and capistrano'
  curl -sSL https://get.rvm.io | bash -s stable
  rvm install 2.2.1
  rvm --default use 2.2.1

  # Ruby gems
  gem install capistrano
}

function _init_all() {
  _init_links;
  _init_brew;
  _init_npm;
  _init_atom;
  _init_rvm;
  _init_sublime;
}

# Do stuff
action="$1"
case "$action" in
  links)
    _init_links;
  ;;
  npm)
    _init_npm;
  ;;
  atom)
    _init_atom;
  ;;
  rvm)
    _init_rvm;
  ;;
  sublime)
    _init_sublime;
  ;;
  *)
    _init_all;
  ;;
esac
