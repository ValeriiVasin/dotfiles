#!/usr/bin/env bash

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

packages=(
  ack
  bash-completion
  git
  node
  openssl
  postgresql
  redis
  ssh-copy-id
  tree
  wget
  youtube-dl
)

# @TODO check if already installed
echo "Installing brew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

for package in "${packages[@]}"; do
  # @TODO check if already installed
  echo "installing $package..."
  brew install $package
  echo "$package successfull installed"
done
# brew install casperjs --devel

# Casks
brew install caskroom/cask/brew-cask
casks=(
  atom
  calibre
  chitchat
  firefox
  flickr-uploadr
  gitx
  google-chrome
  google-chrome-canary
  imageoptim
  iterm2
  messenger
  opera
  send-to-kindle
  sequel-pro
  skitch
  skitch
  skype
  slack
  sourcetree
  steam
  telegram
  trello-x
  tunnelbear
  utorrent
  virtualbox
  vlc
  visual-studio-code
)

for cask in "${casks[@]}"; do
  echo "installing $cask..."
  brew cask install $cask
  echo "$cask successfull installed"
done

# install sublime text 3
brew tap caskroom/versions
brew cask install sublime-text3
