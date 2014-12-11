#!/usr/bin/env sh

# Sublime text
DROPBOX_FOLDER="$HOME/Dropbox"
DOTFILES_FOLDER="$HOME/dotfiles"

echo "Installing brew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew install git bash-completion ssh-copy-id node
brew install casperjs --devel
echo "Installing npm packages"
npm install -g npm@latest jshint grunt-cli gulp

echo "Linking files to home folder"
for file in $(find $DOTFILES_FOLDER/home -type f); do
  echo "File: $file"
  [ -r "$file" ] && ln -sf $file "$HOME/$(basename $file)"
done

echo "Making alias for sublime text..."
mkdir -p $HOME/bin
ln -s "/Applications/Sublime Text 3.app/Contents/SharedSupport/bin/subl" $HOME/bin/subl

echo "Linking sublime packages"
cd "$HOME/Library/Application Support/Sublime Text 3"
rm -r Installed\ Packages
rm -r Packages
ln -s "$DROPBOX_FOLDER/Shared/SublimeText3/Installed Packages"
ln -s "$DROPBOX_FOLDER/Shared/SublimeText3/Packages"

# SSH
mkdir -p $HOME/.ssh
# @TODO create ssh keys if not exist
if [ ! -f "$HOME/.ssh/id_rsa.pub" ]; then
  echo "SSH key does not exist. Generating it..."
  ssh-keygen -t rsa -C "valerii.vasin@gmail.com"
fi
chmod 600 $HOME/.ssh/*
chmod 700 $HOME/.ssh
cd $HOME/.ssh
ln -sf $DROPBOX_FOLDER/dotfiles/ssh-config $HOME/.ssh/config

