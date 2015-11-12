#!/usr/bin/env sh

packages=(
  eslint
  grunt-cli
  gulp
  jscs
  jshint
  live-server
  pm2
)

echo "Installing globally available npm packages..."
for package in "${packages[@]}"; do
  # @TODO check if already installed
  echo "installing $package..."
  npm install -g $package
  echo "$package successfull installed."
done
