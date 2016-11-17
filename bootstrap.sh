#!/bin/bash

sudo apt-get update
sudo apt-get install -y ansible vim

sudo echo "192.168.1.111" >> /etc/ansible/hosts
sudo echo "192.168.1.112" >> /etc/ansible/hosts

#ssh-keygen -t rsa
#ssh-agent bash
#ssh-add ~/.ssh/id_rsa
#ssh-copy-id 192.168.1.111
#ssh-copy-id 192.168.1.112