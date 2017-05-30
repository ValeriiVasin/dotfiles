alias gitx='gitx --all'
alias ruby='ruby -rubygems'
alias be='bundle exec'
alias wip='bundle exec cucumber -p wip'

alias npm-reinstall="rm -rf node_modules/ && npm cache clean && npm install"
alias redis-start="redis-server /usr/local/etc/redis.conf"
alias postgres-start="postgres -D /usr/local/var/postgres"

# https://remysharp.com/2017/05/29/getting-free-wifi
alias freewifi="sudo ifconfig en0 ether `openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'`"

alias e=$EDITOR

# own custom aliases
alias hosts='$EDITOR /etc/hosts'

# execute local npm binary
# => npx jest
alias npx='PATH=$(npm bin):$PATH'
