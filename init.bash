#!/usr/bin/env bash

CURRENT_FOLDER="$(CDPATH= cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# use exports
. $CURRENT_FOLDER/system/exports.bash

function _init_vscode() {
  echo "Linking VSCode packages"

  vscode_extensions="$HOME/.vscode"
  vscode_extensions_dropbox="$DROPBOX_FOLDER/Shared/.vscode"
  vscode_settings=$HOME/Library/Application\ Support/Code/User
  vscode_settings_dropbox="$DROPBOX_FOLDER/Shared/VSCodeUser"

  rm -rf "$vscode_extensions"
  ln -sf "$vscode_extensions_dropbox" "$vscode_extensions"

  rm -rf "$vscode_settings"
  ln -sf "$vscode_settings_dropbox" "$vscode_settings"
}

function _init_npm() {
  . $DOTFILES_FOLDER/init/npm.bash
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
  _init_rvm;
  _init_vscode;
}

# $DOTFILES_FOLDER/init.bash links
action="$1"
case "$action" in
  links)
    _init_links;
  ;;
  npm)
    _init_npm;
  ;;
  rvm)
    _init_rvm;
  ;;
  vscode)
    _init_vscode;
  ;;
  *)
    _init_all;
  ;;
esac
