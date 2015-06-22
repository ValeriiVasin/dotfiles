function IN() {
  case "$1" in
        ant)
            in_ant
            ;;
        vagrunt_up)
            in_vagrant_up;
            ;;
        routes)
            in_routes;
            ;;
        grunt_stop)
            in_grunt_stop;
            ;;
        rm_cache)
            in_rm_cache;
            ;;
        *)
            echo "Usage: IN {ant|vagrant_up|routes|rm_cache}"
            ;;
    esac
}

in_ant() {
  cd $HOME/Projects/in-solr;
  git pull;
  cd -;
  vagrant ssh -c "cd /code/in && sudo ant; cd /code/in-solr && sudo ant;";
}

in_vagrant_up() {
  sudo node $HOME/dotfiles/scripts/in $1;
}

in_routes() {
  vagrant ssh -c "cd /code/in && sudo php app-new/console router:debug"
}

in_grunt_stop() {
  ps aux | grep grunt | awk '{ print $2 }' | xargs kill
}

in_rm_cache() {
  vagrant ssh -c "sudo rm -rf /dev/shm/symfony/632636088/cache/"
}

export -f IN;
