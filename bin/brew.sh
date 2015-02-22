#!/usr/bin/env sh

packages=(
  ack
  bash-completion
  git
  node
  ssh-copy-id
  wget
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
brew install casperjs --devel

# Casks
brew install caskroom/cask/brew-cask
casks=(
  firefox
  gitx
  google-chrome
  iterm2
  opera
  skitch
  skype
  tunnelbear
  virtualbox
  vlc
)

for cask in "${casks[@]}"; do
  echo "installing $cask..."
  brew cask install $cask
  echo "$cask successfull installed"
done
