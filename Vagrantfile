# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  # Default vagrant box
  config.vm.box = "squeeze64"
  config.vm.box_url = "http://dl.dropbox.com/u/54390273/vagrantboxes/Squeeze64_VirtualBox4.2.4.box"
  
  config.vm.hostname = "omroepzeeland"
  config.vm.network "private_network", ip: "10.22.22.22"

  config.vm.synced_folder "./", "/vagrant"

  # @see http://www.virtualbox.org/manual/ch08.html#idp58775840
  config.vm.provider "virtualbox" do |v|
    v.customize [
      "modifyvm", :id,
      "--memory", 2048,
      "--name", "omroepzeeland"
    ]
  end

  # config.vm.provision :shell, :path => "provision/dotdeb.sh"
  config.vm.provision :shell, :path => "provision/base.sh" 
  config.vm.provision :shell, :path => "provision/apache_php.sh"
  config.vm.provision :shell, :path => "provision/mysql.sh"
  config.vm.provision :shell, :path => "provision/memcached.sh"

  # config.vm.provision :shell, :path => "provision/nginx.sh"
  # config.vm.provision :shell, :path => "provision/redis-server.sh"
  # config.vm.provision :shell, :path => "provision/solr.sh"
  # config.vm.provision :shell, :path => "provision/varnish.sh"

  # Oh My Shell install script
  config.vm.provision :shell, :path => "provision/oms.sh"
  
end
