# -*- mode: ruby -*-
# vi: set f=ruby :

NOT_AGENTS=1

Vagrant.configure(2) do |config|
    config.vm.box = "chad-thompson/ubuntu-trusty64-gui"
    config.vm.synced_folder "shared", "/tmp/shared"

    config.vm.provider :virtualbox do |vbox|
        vbox.gui = true
        vbox.memory = 4096
        vbox.cpus = 2
    end
    
    config.vm.define "ansible" do |ansible|
        ansible.vm.hostname = "samsansible.qac.local"
        ansible.vm.network :public_network, ip: "192.168.1.110"
        ansible.vm.provision :shell, path: "bootstrap.sh"
        
        ansible.vm.provider :virtualbox do |vbox|
            vbox.name = "Ansible Ubuntu"
        end
    end
    
    NOT_AGENTS.times do |i|
        config.vm.define "notagent#{i+1}" do |notagent|
            notagent.vm.hostname = "notagent#{i+1}.qac.local"
            notagent.vm.network :public_network, ip: "192.168.1.11#{i+1}"
            #notagent.vm.provision :shell, path: "bootstrap.sh"
            
            notagent.vm.provider :virtualbox do |vbox|
                vbox.name = "Ubuntu Not-Agent #{i+1}"
            end
        end
    end
end