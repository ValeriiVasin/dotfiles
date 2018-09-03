# Remove local ~/.vscode
# Make link <Dropbox>/Shared/.vscode => ~/.vscode
# rm ~/Library/Application\ Support/Code/User
# Make Link <Dropbox>/Shared/VSCodeUser to $HOME/Library/Application\ Support/Code/User

VSCODE_FOLDER="$HOME/.vscode"
VSCODE_FOLDER_DROPBOX="$DROPBOX_FOLDER/Shared/.vscode"

VSCODE_USER_FOLDER="$HOME/Library/Application Support/Code/User"
VSCODE_USER_FOLDER_DROPBOX="$DROPBOX_FOLDER/Shared/VSCodeUser"

# rm -rf "$VSCODE_FOLDER"
# ln -s  $VSCODE_FOLDER_DROPBOX $VSCODE_FOLDER


# User settingsл
# rm -rf "$VSCODE_USER_FOLDER"
# ln -s "$VSCODE_USER_FOLDER_DROPBOX" "$VSCODE_USER_FOLDER"

# # extensions
# extensions=(
#   ng-template
#   bracket-pair-colorizer
#   editorconfig
#   vscode-docker
#   project-manager
#   stylus
#   path-intellisense
#   mustache
#   vscode-eslint
#   githistory
#   tslint
#   vscode-npm-script
#   prettier-vscode
#   vue
#   js-atom-grammar
#   debugger-for-chrome
#   typescript-hero
#   vscode-icons
#   final-newline
#   GitLenth
#   stylint
#   change-case
#   javascriptsnippets
# )

# echo "Installing vscode extensions..."
# for extension in "${extensions[@]}"; do
#   # @TODO check if already installed
#   echo "installing $extension..."
#   code --install-extension $extension
# done
