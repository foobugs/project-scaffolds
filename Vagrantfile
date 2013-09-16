# -*- mode: ruby -*-
# vi: set ft=ruby :

##
# Vagrantfile
#
# All default Vagrant configuration is done here. For a complete reference,
# please see the online documentation at http://docs.vagrantup.com/.
##

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  ##
  # Every Vagrant virtual environment requires a box to build off of.
  ##
  config.vm.box = "precise64"

  ##
  # The url from where the 'config.vm.box' box will be fetched if it doesn't
  # already exist on the user's system.
  ##
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  ##
  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  ##
  # config.vm.network :forwarded_port, guest: 80, host: 8080
  # config.vm.network :forwarded_port, guest: 443, host: 8443, host_ip: "0.0.0.0"
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 443, host: 8443

  ##
  # Share an additional folder to the guest VM. The first argument is the path
  # on the host to the actual folder. The second argument is the path on the
  # guest to mount the folder. And the optional third argument is a set of
  # non-required options.
  ##
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.synced_folder "./", "/vagrant", :id => "vagrant-root", :group => "www-data", :extra => "dmode=775,fmode=764"

  ##
  # Enable shell provisioning to upload and execute a script as the root user
  # within the guest machine.
  ##
  config.vm.provision :shell do |shell|
    # Install current chef version
    shell.inline = "
      if [ ! -f \"/opt/chef/bin/chef-solo\" ]
      then
        wget -q -O- https://www.opscode.com/chef/install.sh | sudo bash
      fi
      echo \"PATH=/opt/chef/embedded/bin:$PATH\" > /etc/profile.d/chef.sh"
  end

  ##
  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  ##
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "./chef/cookbooks"
    chef.roles_path = "./chef/roles"
    chef.data_bags_path = "./chef/data_bags/vagrant"
  
    chef.add_role "vagrant"
    # chef.add_recipe "mysql"
  
    # # You may also specify custom JSON attributes:
    # chef.json = { :mysql_password => "foo" }
  end
end

# Load Vagrantfile.local to overwrite or extend default Vagrant configuration
load "Vagrantfile.local" if File.exists?("Vagrantfile.local")
