#!/usr/bin/env bash

packages=(
  npm-check-updates
)

echo "Installing globally available npm packages..."
for package in "${packages[@]}"; do
  # @TODO check if already installed
  echo "installing $package..."
  npm install -g $package
  echo "$package successfull installed."
done
