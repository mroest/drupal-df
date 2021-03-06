#!/bin/sh

aptitude update

aptitude install -y \
      vim \
      php5 \
      php5-common \
      php5-cli \
      php5-dev \
      php-pear \
      php5-imagick \
      php5-gd \
      php5-mysql \
      php5-curl \
      php5-xdebug \
      php5-zendopcache \
      php5-memcache \
      php5-memcached \
      php5-redis \
      php5-mcrypt \
      git \
      build-essential \
      ant \
      wget \
      openjdk-6-jdk \
      openjdk-6-jre \
      zip \
      unzip \
      zsh


a2enmod rewrite
a2enmod expires
a2enmod headers
cat /vagrant/provision/xdebug.ini >> /etc/php5/mods-available/xdebug.ini

