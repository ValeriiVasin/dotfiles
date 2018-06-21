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
alias gh='github'

alias auth="cd $HOME/Projects/merchant-center-auth"
alias minsky="cd $HOME/Projects/merchant-center-minsky-itier"

alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"
alias config="cd $HOME/Projects/itier-bootstrap; make config; cd -;"
alias record="curl http://www.radiorecord.ru/rss.xml | grep mp3"
