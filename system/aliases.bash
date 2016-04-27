alias gitx='gitx --all'
alias ruby='ruby -rubygems'
alias be='bundle exec'
alias wip='bundle exec cucumber -p wip'

alias npm-reinstall="rm -rf node_modules/ && npm cache clean && npm install"
alias redis-start="redis-server /usr/local/etc/redis.conf"
alias postgres-start="postgres -D /usr/local/var/postgres"

alias e=$EDITOR

# own custom aliases
alias hosts='$EDITOR /etc/hosts'
