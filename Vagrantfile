drupaldistro = df
project = demo

Vagrant.configure("2") do |config|
  # The path to the Berksfile to use with Vagrant Berkshelf
  config.berkshelf.enabled = true
  config.berkshelf.berksfile_path = "./Berksfile"
  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to skip installing and copying to Vagrant's shelf.
  # config.berkshelf.only = []

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to skip installing and copying to Vagrant's shelf.
  # config.berkshelf.except = []

  #config.vm.box = "fr-debian-squeeze" #(Chef 11: Unstable)
  #config.vm.box_url = "http://public.sphax3d.org/vagrant/squeeze64.box"

  #config.vm.box = "squeeze" #(Promet Default)
  #config.vm.box_url = "https://s3.amazonaws.com/wa.milton.aws.bucket01/sqeeze.box"

  config.vm.box = "squeeze-amd64" #(vagrantbox.es)
  config.vm.box_url = "https://dl.dropboxusercontent.com/u/13054557/vagrant_boxes/debian-squeeze.box"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", 2048]
  end

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  # config.vm.network :forwared_port, guest: 80, host: 8080,
  #   auto_correct: true
  # config.vm.network :forwared_port, guest: 22, host: 2201,
  #   auto_correct: true

  config.vm.synced_folder ".", "/var/drupals/#{project}"

  config.vm.hostname = "drupal-#{project}"

  config.ssh.max_tries      = 40
  config.ssh.timeout        = 120
  # forwarding the agent to allow vagrant user to ssh between environments
  config.ssh.forward_agent  = true

  config.vm.network :private_network, ip: "10.73.36.10"
  config.vm.provision :chef_solo do |chef|
    chef.json = {
      :mysql => {
        :server_root_password => 'rootpass',
        :server_debian_password => 'debpass',
        :server_repl_password => 'replpass',
        :tunable => {
        :max_allowed_packet => '256M'
      }
      },
      :drupal => {
        :drush => {
          :version => "8.x-6.x-dev",
        },
        :sites => {
          "#{project}.dev" => {
            :root => "/var/drupals/#{project}",
            :doc_root => "/var/drupals/#{project}/docroot",
          }
        }
      },
      :apache => {
        :prefork => {
          :startservers => 5,
          :minspareservers => 5,
          :maxspareservers => 5,
          :serverlimit => 10,
          :maxclients => 10
        }
      }
    }

    chef.add_recipe "solo-helper"
    chef.add_recipe "chef-solo-search"
    chef.add_recipe "drupal::node_sites"
    chef.add_recipe "drupal::drush"
  end

  config.vm.provision :shell, :inline => "mysql -u root -e \"GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '' WITH GRANT OPTION; FLUSH PRIVILEGES;\" --password=rootpass"
  config.vm.provision :shell, :inline => "sudo perl -pi -w -e 's/memory_limit = 128M/memory_limit = 512M/g;' /etc/php5/apache2/php.ini"
  config.vm.provision :shell, :inline => "sudo perl -pi -w -e 's/max_execution_time = 30/max_execution_time = 120/g;' /etc/php5/apache2/php.ini"
  config.vm.provision :shell, :inline => "sudo apache2ctl restart"
  config.vm.provision :shell, :inline => "drush si #{drupaldistro} --site-name=#{project} --root=/var/drupals/#{project}/docroot -y"
  config.vm.provision :shell, :inline => "chmod +w /var/drupals/#{project}/docroot/sites/default/settings.php"
  config.vm.provision :shell, :inline => "drush -r /var/drupals/#{project}/docroot -l http://#{project}.dev uli"

end
