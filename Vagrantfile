# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  # vagrant box add wheezy32 http://tools.swergroup.com/downloads/wheezy32.box
  config.vm.box = "ib-deb71"
  
  config.vm.hostname = "demo.dev"

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
  config.vm.provision :shell, :path => "packages.sh" 
  config.vm.provision :shell, :path => "apache.sh"
  config.vm.provision :shell, :path => "privs.sh"  
  config.vm.provision :shell, :path => "oms.sh"
  config.vm.provision :shell, :path => "install_demo.sh"

end
