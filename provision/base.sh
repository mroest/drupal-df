#!/bin/sh

aptitude update

aptitude install -y \
      vim \
      php5 \
      php5-cli \
      php5-curl \
      php5-gd \
      php5-ldap \
      php5-mcrypt \
      php5-memcache \
      php5-mysql \
      php5-suhosin \
      php5-imagick \
      php5-xdebug \
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

