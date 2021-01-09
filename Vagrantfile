# -*- mode: ruby -*-
# vim: set ft=ruby :
# RR

MACHINES = {
  :tun => {
        :box_name => "centos/7",
        :net => [
                   {ip: '172.16.10.10', adapter: 2},
                   {ip: '1.1.1.1', adapter: 3, virtualbox__intnet: "inet"},                   
                   {ip: '192.168.10.1', adapter: 4, virtualbox__intnet: "tun"}                                    
                   
                ]
  },
  :tap => {
        :box_name => "centos/7",
        :net => [
                   {ip: '172.16.10.20', adapter: 2},
                   {ip: '1.1.1.2', adapter: 3, virtualbox__intnet: "inet"},                   
                   {ip: '192.168.20.1', adapter: 4, virtualbox__intnet: "tap"}                                                         
                ]
  },
}

#############################################################################################################
Vagrant.configure("2") do |config|
  MACHINES.each do |boxname, boxconfig|
    config.vm.define boxname do |box|
        box.vm.box = boxconfig[:box_name]
        box.vm.host_name = boxname.to_s
        boxconfig[:net].each do |ipconf|
          box.vm.network "private_network", ipconf
        end
        if boxconfig.key?(:public)
          box.vm.network "public_network", boxconfig[:public]
        end
        box.vm.provision "shell", path: "config/sshscript.sh"
        config.vm.provision :ansible do |ansible|
        ansible.inventory_path = "playbook/inv.yml"
            ansible.limit = $name
        ansible.playbook = "playbook/main.yml"
        end
      end
  end
end

