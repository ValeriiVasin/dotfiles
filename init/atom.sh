#!/usr/bin/env sh

packages=(
  minimap
  git-plus
  linter
  editorconfig
  project-manager
  atom-beautify
  docblockr
  sort-lines
  language-haml
)

for package in "${packages[@]}"; do
  if [[ ! -d "$HOME/.atom/packages/$package" ]]
  then
    echo "Installing $package..."
    apm install $package
  else
    echo "Package '$package' is already installed..."
  fi
done
