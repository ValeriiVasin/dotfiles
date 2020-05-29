#!/usr/bin/env bash

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

packages=(
  ack
  bash-completion
  colordiff
  git
  node
  openssl
  postgresql
  redis
  ssh-copy-id
  tree
  wget
  yarn
  youtube-dl
  fzf
  diff-so-fancy
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
