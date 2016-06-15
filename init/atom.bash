#!/usr/bin/env bash

packages=(
  atom-beautify
  atom-typescript
  autocomplete-paths
  docblockr
  editorconfig
  emmet
  git-plus
  highlight-selected
  language-haml
  linter
  linter-eslint
  linter-jsonlint
  linter-stylint
  linter-tslint
  minimap
  project-manager
  react
  sort-lines
  stylus
  hyperclick
  js-hyperclick
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
