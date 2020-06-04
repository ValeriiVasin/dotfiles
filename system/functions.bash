# Create a new directory and enter it
function md() {
  mkdir -p "$1" && cd "$1"
}

refresh() {
  source $HOME/.profile
}

# find shorthand
f() {
  find . -name "$1"
}

# cd into whatever is the forefront Finder window.
cdf() { # short for cdfinder
  cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')"
}

# Start an HTTP server from a directory, optionally specifying the port
server() {
  local port="${1:-8000}"
  # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
  # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
  python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

# Restart internet connection for my mac
network_restart() {
  sudo ifconfig en0 down
  sudo ifconfig en0 up
}

# Compare original and gzipped file size
function gz() {
  local origsize=$(wc -c <"$1")
  local gzipsize=$(gzip -c "$1" | wc -c)
  local ratio=$(echo "$gzipsize * 100 / $origsize" | bc -l)
  printf "orig: %d bytes\n" "$origsize"
  printf "gzip: %d bytes (%2.2f%%)\n" "$gzipsize" "$ratio"
}

# supposed to be used in conjunction with ack
#
# @example
#   ack headerV1NavigationIconSize -l | replace_text headerV1NavigationIconSize membershipIconSizeMedium
replace_text() {
  while read filename; do
    replace_expression="s/$1/$2/g"
    sed -i '' "$replace_expression" $filename
  done
}

# Open project folder
project() {
  cd "$PROJECTS_FOLDER/$1"
}

# connect to server and open project directory
# Example:
#
# - Open remote directory of "charts" project
#   project_remote charts
#
# - Open remote directory of <current folder name> project
#   project_remote
project_remote() {
  local project="$1"

  if [ -z "$project" ]; then
    project="$(basename $(pwd))"
  fi

  ssh do -t "cd /var/www/$project/current; bash --login"
}

dotfiles() {
  cd $DOTFILES_FOLDER
}

git-rm-stale() {
  for branch in $(git branch --merged | grep -v master); do
    git branch -d $branch
  done
}

yarn-upgrade() {
  brew rm yarn
  brew install yarn --ignore-dependencies
}

jira() {
  $DOTFILES_FOLDER/bin/jira $@
}

npmrc() {
  if [ -f $HOME/.npmrc ]; then
    echo "moving .npmrc => .npmrc-groupon"
    mv $HOME/.npmrc $HOME/.npmrc-groupon
  else
    echo "moving .npmrc-groupon => .npmrc"
    mv $HOME/.npmrc-groupon $HOME/.npmrc
  fi
}

mouse() {
  if [ $1 = "home" ]; then
    echo "configuring mouse for home"
    osascript $DOTFILES_FOLDER/scripts/mouse.scpt 7
  else
    echo "configuring mouse for office"
    osascript $DOTFILES_FOLDER/scripts/mouse.scpt 5
  fi
}

check-types() {
  npx tsc --noEmit
}

export -f server
