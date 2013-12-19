#!/bin/sh

aptitude update

echo "mysql-server-5.5 mysql-server/root_password password root" | debconf-set-selections
echo "mysql-server-5.5 mysql-server/root_password_again password root" | debconf-set-selections

aptitude install -y \
      vim \
      php5 \
      git \
      build-essential \
      drush \
      ant \
      wget \
      openjdk-6-jdk \
      openjdk-6-jre \
      zip \
      unzip \
      mysql-common \
      mysql-client \
      mysql-server \
      apache2-mpm-prefork \
      libapache2-mod-php5 \
      php5-imagick \
      php5-xdebug \
      php5-zendopcache \
      memcached \
      memcachedb \
      php5-memcache \
      php5-memcached \
      solr-jetty \
      redis-server \
      php5-redis \
      varnish \
      nginx \

# Don't start services/
/usr/sbin/update-rc.d nginx disable
/usr/sbin/update-rc.d varnish disable
/usr/sbin/update-rc.d memcachedb disable
/usr/sbin/update-rc.d memcached disable
/usr/sbin/update-rc.d redis-server disable

service nginx stop
service varnish stop
service memcachedb stop
service memcached stop
service redis-server stop

