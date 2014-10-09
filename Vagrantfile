# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Multiple Machine Provisioning

  config.vm.define "db" do |db|
    db.vm.hostname = "dbnode0"
    db.vm.box = "chef/debian-7.4"
    db.vm.provision :shell, path: "mysql-bootstrap.sh"
    db.vm.network "public_network",  bridge: 'en0: Ethernet', ip:'<DB_HOST>'
    db.vm.synced_folder "packages/", "/home/vagrant/packages"
  end

  config.vm.define "web" do |web|
    web.vm.hostname = "webnode0"
    web.vm.box = "chef/debian-7.4"
    web.vm.provision :shell, path: "apache-bootstrap.sh"
    # web.vm.network :forwarded_port, host: 4567, guest: 80
    web.vm.network "public_network", bridge: 'en0: Ethernet', ip:'<APACHE_HOST>'
    web.vm.synced_folder "packages/", "/home/vagrant/packages"
  end

end
