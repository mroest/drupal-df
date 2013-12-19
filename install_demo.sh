#!/bin/sh

cp -a /vagrant/demo /etc/apache2/sites-available
a2ensite demo

perl -pi -w -e 's/memory_limit = 128M/memory_limit = 512M/g;' /etc/php5/apache2/php.ini
perl -pi -w -e 's/;date.timezone =/date.timezone = Europe\/Amsterdam/g;' /etc/php5/apache2/php.ini

apache2ctl restart

cp -a /vagrant/settings.php /vagrant/docroot/sites/default/
mysql -u root -e "create database if not exists demo;" --password=root

drush site-install df --site-name=demo --root=/vagrant/docroot -y

mkdir -p /vagrant/docroot/sites/default/files
chmod -R 777 /vagrant/docroot/sites/default/files
