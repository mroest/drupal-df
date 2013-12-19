#!/bin/sh

apt-get install -y \
  apache2-mpm-prefork \
  libapache2-mod-php5 \
  php5-imagick \
  php5-gd \
  php5-curl \
  php5-xdebug \
  php5-zendopcache \
  php5-memcache \
  php5-memcached \
  php5-redis
