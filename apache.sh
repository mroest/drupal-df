#!/bin/sh

cp -a /vagrant/demo /etc/apache2/sites-available
a2ensite demo
apache2ctl restart

