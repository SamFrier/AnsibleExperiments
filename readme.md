# Ansible

## Introduction

## Installation & Setup

Ansible can easily be installed via a package manager such as apt-get or yum:

    ~$ sudo apt-get install -y ansible
    
Alternatively you can use pip, Python’s package manager:

    ~$ sudo pip install ansible

Once you’ve installed Ansible on a host machine, you will need to add any nodes that you want to manage to the file `/etc/ansible/hosts`. You can specify nodes by either their hostname (if applicable) or their IP address.

When Ansible runs it will attempt to access one or more of these nodes via SSH. In order for this to work, you must add your host’s SSH key to the nodes:

    ~$ ssh-keygen -t rsa
    ~$ ssh-agent bash
    ~$ ssh-add ~/.ssh/id_rsa
    ~$ ssh-copy-id user@host
    
By default, Ansible will try to connect using the current logged-in user on the host. Make sure to specify a different username if necessary, and make sure you have added your SSH key to all users + nodes you require (you will need to connect using that user’s password in order to add the key).


## Usage
