# Drupal Demo Framework / DF

This assumes that you want to install the DemoFramework in a Vagrant VM.

You should install http://drupal.org/project/df as described on https://drupal.org/node/2012876.
But since that didn't work for me and I went crazy on the ruby gems, chef and version dependencies
I created a couple of simple shell scripts.

Installing a LAMP server and Drupal site isn't that hard and I believe you shouldn't have to install a shitload of ruby.

Just make sure you have Vagrant and Virtualbox installed and try ./go.sh

## Requirements

+ Debian wheezy 7.1 basebox (see Vagrantfile)
+ Enable the image_allow_insecure_derivatives configuration variable in your settings.php (see install script)
+ Drush version 5.10.0
+ Apache runs with vagrant userid to allow changes in /files

The provisions scripts will meet the requirements except for the basebox. You have to get your own basebox. Fetch one from http://www.vagrantbox.es or build one yourself (if you don't trust others). The Vagrantfile has an example on how to download one from a remote location.

## Known issues

+ https://drupal.org/node/2168749
In order to use the ember theme you should manually download the theme and put it in profiles/df/themes/contrib

### Other things that you might want to changes

+ Caching is disabled (don't know why)
