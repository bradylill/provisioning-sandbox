#!/bin/sh
sh -c "`curl https://babushka.me/up`" </dev/null
ln -s /usr/local/babushka/bin/babushka.rb /usr/local/bin/babushka
babushka version
