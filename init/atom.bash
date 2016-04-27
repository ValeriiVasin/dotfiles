#!/usr/bin/env bash

packages=(
  atom-beautify
  atom-typescript
  autocomplete-paths
  docblockr
  editorconfig
  emmet
  git-plus
  language-haml
  linter
  linter-eslint
  linter-tslint
  minimap
  project-manager
  react
  sort-lines
  linter-stylint
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
