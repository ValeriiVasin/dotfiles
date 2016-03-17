#!/usr/bin/env sh

packages=(
  atom-beautify
  atom-typescript
  docblockr
  editorconfig
  emmet
  git-plus
  language-haml
  linter
  linter-eslint
  minimap
  project-manager
  react
  sort-lines
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
