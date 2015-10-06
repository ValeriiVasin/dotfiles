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

in_solr() {
  # Run solr import for everything
  vagrant ssh -c "cd /code/in && sudo php app-new/console search:dataimport fullimport all --clean=1"

  # Check status
  while [ "$(vagrant ssh -c 'cd /code/in && sudo php app-new/console search:dataimport status  all' | grep busy | wc -l)" -ne "0" ]; do
    echo "Waiting for solr import to finish... $result"
    sleep 10;
  done
}

in_services_restart() {
  vagrant ssh -c "sudo /etc/init.d/nginx restart &&\
                  sudo /etc/init.d/php5-fpm restart &&\
                  sudo /etc/init.d/rabbitmq-server restart &&\
                  sudo /etc/init.d/redis-server restart &&\
                  sudo /etc/init.d/tomcat6 restart &&\
                  sudo /etc/init.d/mysql restart"
}

# update solr, remove cache, restart memcached, make request to page to create a cache again
in_update() {
  in_ant && in_rm_cache && in_services_restart && wget -q --spider internations.dev
}
