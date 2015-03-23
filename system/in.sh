function IN() {
  case "$1" in
        ant)
            in_ant
            ;;
        vagrunt_up)
            in_vagrant_up;
            ;;
        *)
            echo "Usage: IN {ant|vagrant_up}"
            ;;
    esac
}

function in_ant() {
  vagrant ssh -c "cd /code/in && sudo ant; cd /code/in-solr && sudo ant;";
}

in_vagrant_up() {
  sudo node $HOME/dotfiles/scripts/in;
}

export -f IN;
