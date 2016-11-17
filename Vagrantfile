# -*- mode: ruby -*-
# vi: set f=ruby :

NODES=2

Vagrant.configure(2) do |config|
    config.vm.box = "chad-thompson/ubuntu-trusty64-gui"
    config.vm.synced_folder "shared", "/tmp/shared"

    config.vm.provider :virtualbox do |vbox|
        vbox.gui = true
        vbox.memory = 4096
        vbox.cpus = 2
    end
    
    NODES.times do |i|
        config.vm.define "ansible_node#{i+1}" do |node|
            node.vm.hostname = "ansiblenode#{i+1}.qac.local"
            node.vm.network :public_network, ip: "192.168.1.#{i+111}"
            #node.vm.provision :shell, path: "bootstrap.sh"
            
            node.vm.provider :virtualbox do |vbox|
                vbox.name = "Ansible Node #{i+1}"
            end
        end
    end
	
	config.vm.define "ansible_master" do |master|
        master.vm.hostname = "ansiblemaster.qac.local"
        master.vm.network :public_network, ip: "192.168.1.110"
        master.vm.provision :shell, path: "bootstrap.sh"
        
        master.vm.provider :virtualbox do |vbox|
            vbox.name = "Ansible Master"
        end
    end
	
end