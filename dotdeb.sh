#!/bin/sh

cat /vagrant/dotdeb > /etc/apt/sources.list
apt-key add /vagrant/dotdeb.gpg

