#!/bin/sh

aptitude update

aptitude install -y \
      vim \
      php5 \
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
      drush \
      ant \
      wget \
      openjdk-6-jdk \
      openjdk-6-jre \
      zip \
      unzip \
      zsh
