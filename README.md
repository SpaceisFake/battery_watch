# battery_watch
A short script for monitoring battery use that uses some cool sed, awk, and printf expressions to chop up data.

example to begin collecting data:
$ touch /var/log/battery_watch
$ ln -s ./watch.sh /bin/bash/watch.sh
$ echo "*/5 * * * * 

