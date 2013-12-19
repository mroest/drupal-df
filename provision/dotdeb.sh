#!/bin/sh

cat /vagrant/provision/dotdeb > /etc/apt/sources.list
apt-key add /vagrant/provision/dotdeb.gpg

