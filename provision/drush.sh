#!/bin/sh

apt-get install php-console-table
pear channel-discover pear.drush.org
pear install drush/drush-5.10.0.0
