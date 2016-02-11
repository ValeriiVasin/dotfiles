export DOTFILES_FOLDER="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"
export DROPBOX_FOLDER="$HOME/Dropbox"
export PROJECTS_FOLDER="$HOME/Projects"

export PATH="./node_modules/.bin:$DOTFILES_FOLDER/bin:$PATH"

export ARCHFLAGS="-arch x86_64"

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups

# Docker
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=$HOME/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

# favorite editor
export EDITOR="atom"

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

export NODE_ENV=development
