#!/bin/sh

vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-hostsupdater

drush make ./build-df.make ./docroot
vagrant up
