#!/bin/sh

aptitude update

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
      zsh

