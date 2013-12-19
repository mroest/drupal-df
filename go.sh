#!/bin/sh

vagrant plugin install vagrant-berkshelf
drush make ./build-df.make ./
vagrant up
