#!/usr/bin/env sh

CURRENT_FOLDER="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";

# use exports
source $CURRENT_FOLDER/system/exports.sh

source $DOTFILES_FOLDER/init/brew.sh
source $DOTFILES_FOLDER/init/npm.sh
source $DOTFILES_FOLDER/init/atom.sh

echo "Linking files to home folder..."
for file in $(find $DOTFILES_FOLDER/home -type f); do
  [ -r "$file" ] && ln -sf $file "$HOME/$(basename $file)"
done

# SUBLIME
echo "Linking sublime packages"
cd "$HOME/Library/Application Support/Sublime Text 3"
rm -r Installed\ Packages
rm -r Packages
ln -s "$DROPBOX_FOLDER/Shared/SublimeText3/Installed Packages"
ln -s "$DROPBOX_FOLDER/Shared/SublimeText3/Packages"

# SSH
mkdir -p $HOME/.ssh
if [ ! -f "$HOME/.ssh/id_rsa.pub" ]; then
  echo "SSH key does not exist. Generating it..."
  ssh-keygen -t rsa -C "valerii.vasin@gmail.com"
fi
chmod 600 $HOME/.ssh/*
chmod 700 $HOME/.ssh
cd $HOME/.ssh
ln -sf $DROPBOX_FOLDER/dotfiles/ssh-config $HOME/.ssh/config

# RVM + ruby
echo 'Installing rvm, ruby and capistrano'
curl -sSL https://get.rvm.io | bash -s stable
rvm install 2.2.1
rvm --default use 2.2.1

# Ruby gems
gem install capistrano
