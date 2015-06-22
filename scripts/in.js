/**
 * InterNations helper scripts
 */
/*eslint-env node*/
(function() {
  'use strict';

  var exec = require('child_process').exec;
  // timeout in seconds between attempts
  var timeout = process.argv[2] ? Number(process.argv[2]) : 100;

  console.log('Timout between attempts: %d seconds', timeout);

  var attempt = 0;
  function vagrantUp() {
    attempt += 1;
    console.log('Trying to up Vagrant.... Attempt #' + attempt);

    var cp = exec('vagrant halt && vagrant up', {
      timeout: timeout * 1000
    }, function(err) {
      if (err) {
        console.log('[FAILED] ', err.message);

        // kill all vagrant processes
        exec('ps aux | grep vagrant | awk \'{ print $2 }\' | xargs kill', vagrantUp);
        return;
      }

      console.log('Success!');

      // beep
      process.stdout.write('\x07');
    });

    cp.stdout.pipe(process.stdout);
    cp.stderr.pipe(process.stderr);
  }

  vagrantUp();
})();
