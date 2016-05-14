#!/usr/bin/env bash

packages=(
  browserify
  db-migrate
  eslint
  grunt-cli
  gulp
  imageoptim-cli
  jasmine
  jscs
  jshint
  karma-cli
  live-server
  n
  npm-check
  npm-check-updates
  pm2
  stylint
  stylus
  trymodule
  tslint
  typescript
  concurrently
)

echo "Installing globally available npm packages..."
for package in "${packages[@]}"; do
  # @TODO check if already installed
  echo "installing $package..."
  npm install -g $package
  echo "$package successfull installed."
done