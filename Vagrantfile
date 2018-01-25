# -*- mode: ruby -*-
# # vi: set ft=ruby :

Vagrant.configure(2) do |config|
  (1..1).each do |i|
    config.vm.define "vm#{i}" do |s|
      s.vm.box = "bento/ubuntu-16.04"
      s.vm.hostname = "vm#{i}"
      s.vm.provision :shell, path: "scripts/bootstrap_rancher.sh"
      s.vm.network "private_network", ip: "192.168.50.1#{i}"
      s.vm.provider "virtualbox" do |v|
        v.name = "vm#{i}"
        v.memory = 1000
        v.gui = false
      end
    end
  end
  (2..4).each do |i|
    config.vm.define "vm#{i}" do |s|
      s.vm.box = "bento/ubuntu-16.04"
      s.vm.hostname = "vm#{i}"
      s.vm.provision :shell, path: "scripts/bootstrap.sh"
      s.vm.network "private_network", ip: "192.168.50.1#{i}"
      s.vm.provider "virtualbox" do |v|
        v.name = "vm#{i}"
        v.memory = 1500
        v.gui = false
      end
    end
  end
end