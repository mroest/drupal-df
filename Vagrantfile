# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  # vagrant box add wheezy32 http://tools.swergroup.com/downloads/wheezy32.box
  config.vm.box = "ib-deb71"
  
  config.vm.hostname = "demo"
  config.vm.network "private_network", ip: "10.22.22.22"

  config.vm.synced_folder "./", "/vagrant"

  # @see http://www.virtualbox.org/manual/ch08.html#idp58775840
  config.vm.provider "virtualbox" do |v|
    v.customize [
      "modifyvm", :id,
      "--memory", 1024,
      "--name", "demo",
      "--cpuexecutioncap", "50"
    ]
  end

  config.vm.provision :shell, :path => "dotdeb.sh"
  config.vm.provision :shell, :path => "base.sh" 
  config.vm.provision :shell, :path => "apache_php.sh"
  config.vm.provision :shell, :path => "mysql.sh"

  # config.vm.provision :shell, :path => "memcached.sh"
  # config.vm.provision :shell, :path => "nginx.sh"
  # config.vm.provision :shell, :path => "redis-server.sh"
  # config.vm.provision :shell, :path => "solr.sh"
  # config.vm.provision :shell, :path => "varnish.sh"

  config.vm.provision :shell, :path => "oms.sh"
  
  # Install Drupal Demo Framework
  config.vm.provision :shell, :path => "install_demo.sh"
  

end
