#!/bin/sh

service apache2 stop

perl -pi -w -e 's/www-data/vagrant/g;' /etc/apache2/envvars
perl -pi -w -e 's/memory_limit = 128M/memory_limit = 512M/g;' /etc/php5/apache2/php.ini
perl -pi -w -e 's/;date.timezone =/date.timezone = Europe\/Amsterdam/g;' /etc/php5/apache2/php.ini
perl -pi -w -e 's/;date.timezone =/date.timezone = Europe\/Amsterdam/g;' /etc/php5/cli/php.ini

cp -a /vagrant/demo /etc/apache2/sites-available
a2ensite demo

cd /vagrant
drush make ./build-df.make ./docroot

rm -rf /var/lock/apache2
service apache2 start

cp -a /vagrant/settings.php /vagrant/docroot/sites/default/
mysql -u root -e "create database if not exists demo;" --password=root

cd /vagrant/docroot
drush site-install df --site-name=demo --sites-subdir=default -y
drush cc all
sh profiles/df/modules/dfs/dfs_wem/dfs_wem.sh

drush upwd admin --password=demo
drush upwd JenniferThomson --password=demo
