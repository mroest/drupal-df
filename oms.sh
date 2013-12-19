#!/bin/sh

# Update oh-my-shell installer
wget --no-check-certificate https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O /vagrant/install_oms.sh
/bin/chmod 755 /vagrant/install_oms.sh

