function _osx_exports() {
  [[ -r "$HOME/osx.env" ]] && . $HOME/osx.env
  export NODE_ENV=development
  export EDITOR="atom"
  export DROPBOX_FOLDER="$HOME/Dropbox"
  export PROJECTS_FOLDER="$HOME/Projects"

  # Docker
  export DOCKER_HOST=tcp://192.168.59.103:2376
  export DOCKER_MACHINE_NAME=default
  export DOCKER_TLS_VERIFY=1
}

function _linux_exports() {
  [[ -r "$HOME/linux.env" ]] && . $HOME/linux.env
  export NODE_ENV=production
}

function _shared_exports() {
  [[ -r "$HOME/shared.env" ]] && . $HOME/shared.env

  export DOTFILES_FOLDER="$(CDPATH= cd "$(dirname "${BASH_SOURCE[0]}")" && cd .. && pwd)"
  export PATH="$DOTFILES_FOLDER/bin:$PATH"

  export ARCHFLAGS="-arch x86_64"

  # Larger bash history (allow 32³ entries; default is 500)
  export HISTSIZE=32768
  export HISTFILESIZE=$HISTSIZE
  export HISTCONTROL=ignoredups

  export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

  # Prefer US English and use UTF-8
  export LC_ALL="en_US.UTF-8"
  export LANG="en_US"
}

# Private env variables
case "$OSTYPE" in
  # OSX
  darwin*)
    _osx_exports;
    ;;
  linux*)
    _linux_exports;
  ;;
esac

_shared_exports;
