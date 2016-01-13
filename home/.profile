for file in $HOME/dotfiles/system/*; do
    [ -r "$file" ] && source "$file"
done
unset file

# This loads RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# This loads rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

GIT_PS1_SHOWDIRTYSTATE=true
PS1='\[\033[1;30m\][\t] \[\033[01;32m\]\u\[\033[00m\]:\[\033[01;33m\]\w\[\033[00m\]\[\033[01;31m\]$(__git_ps1 " {%s}")\[\033[00m\]\$ '

# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
