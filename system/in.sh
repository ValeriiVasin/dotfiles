function IN() {
  case "$1" in
        ant)
            _in_ant
            ;;
        *)
            echo "Usage: IN {ant}"
            ;;
    esac
}

function _in_ant() {
  vagrant ssh -c "cd /code/in && sudo ant; cd /code/in-solr && sudo ant;";
}

export -f IN;
