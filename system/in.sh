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
        *)
            echo "Usage: IN {ant|vagrant_up|routes}"
            ;;
    esac
}

in_ant() {
  vagrant ssh -c "cd /code/in && sudo ant; cd /code/in-solr && sudo ant;";
}

in_vagrant_up() {
  sudo node $HOME/dotfiles/scripts/in;
}

in_routes() {
  vagrant ssh -c "cd /code/in && sudo php app-new/console router:debug"
}

in_grunt_stop() {
  ps aux | grep grunt | awk '{ print $2 }' | xargs kill
}

export -f IN;
