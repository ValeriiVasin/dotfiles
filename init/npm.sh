#!/usr/bin/env sh

packages=(
  eslint
  jshint
  jscs
  grunt-cli
  gulp
)

echo "Installing globally available npm packages..."
for package in "${packages[@]}"; do
  # @TODO check if already installed
  echo "installing $package..."
  npm install -g $package
  echo "$package successfull installed."
done
