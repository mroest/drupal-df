#!/bin/sh

cp -a /vagrant/settings.php /vagrant/docroot/sites/default/
mysql -u root -e \"create database demo;\" --password=root

drush site-install df --site-name=demo --root=/vagrant/docroot -y

mkdir -p /vagrant/docroot/sites/default/files
chmod -R 777 /vagrant/docroot/sites/default/files

