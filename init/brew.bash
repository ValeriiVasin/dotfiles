#!/usr/bin/env bash

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

packages=(
  ack
  bash-completion
  colordiff
  diff-so-fancy
  fzf
  git
  node
  openssl
  ssh-copy-id
  tree
  wget
  yarn
  youtube-dl
)

# @TODO check if already installed
echo "Installing brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew update

for package in "${packages[@]}"; do
  # @TODO check if already installed
  echo "installing $package..."
  brew install $package
  echo "$package successfull installed"
done
