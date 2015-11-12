#!/usr/bin/env sh

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

packages=(
  ack
  bash-completion2
  git
  node
  openssl
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
  calibre
  chitchat
  firefox
  flickr-uploadr
  gitx
  google-chrome
  imageoptim
  iterm2
  messenger
  opera
  opera
  send-to-kindle
  sequel-pro
  skitch
  skitch
  skype
  slack
  steam
  telegram
  trello-x
  tunnelbear
  utorrent
  virtualbox
  vlc
)

for cask in "${casks[@]}"; do
  echo "installing $cask..."
  brew cask install $cask
  echo "$cask successfull installed"
done
