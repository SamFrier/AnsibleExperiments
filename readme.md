# Ansible: A Beginner's Guide

## Introduction

Ansible is a configuration management tool that allows a single master computer to install software and configure tools and other settings on one or more external “node” computers. Unlike other similar tools such as Puppet, in which nodes must run a daemon and explicitly register with the master, in Ansible there is next to no setup required on the nodes – the host connects to the nodes via SSH and perform any necessary tasks. Configuration management is primarily done via YAML-based scripts called playbooks, but ad-hoc parallel task execution is also possible.

Besides configuration management, Ansible can also be used for application deployment. Ansible is free and open-source; however a paid version called Ansible Tower is also available, which provides a graphical interface through which users can view their inventory and jobs in greater depth and manage them more easily.

## Installation & Setup

Ansible can easily be installed via a package manager such as `apt-get`:

    ~$ sudo apt-get install -y ansible
    
or `yum`:
    
    ~$ sudo yum install -y ansible
    
Alternatively you can use `pip`, Python’s package manager:

    ~$ sudo pip install ansible

Once you’ve installed Ansible on a master machine, you will need to add any nodes that you want to manage to the file `/etc/ansible/hosts`. You can specify nodes by either their hostname (if applicable) or their IP address.

When Ansible runs it will attempt to access one or more of these nodes via SSH. In order for this to work, you must add your master’s SSH key to the nodes:

    ~$ ssh-keygen -t rsa
    ~$ ssh-agent bash
    ~$ ssh-add ~/.ssh/id_rsa
    ~$ ssh-copy-id user@host
    
By default, Ansible will try to connect using the current logged-in user on the master. Make sure to specify a different username if necessary, and make sure you have added your SSH key to all users + nodes you require (you will need to connect using that user’s password in order to add the key).

Alternatively, you can manually copy the key file from the master to the nodes and then append the contents to the end of the node’s `~/.ssh/authorized_keys` file.

## Usage

In the following examples, we will consider a setup consisting of a master machine, `ansiblemaster`, and two node machines with IP addresses `192.168.1.111` and `192.168.1.112` respectively. In all three cases the user of the system has the name `vagrant` (since this infrastructure was set up using Vagrant).

### Ad-hoc Task Execution

The simplest task we can perform is to ping all of the nodes from the master:

    vagrant@ansiblemaster:~$ ansible all –m ping
    192.168.1.111 | success >> {
        “changed”: false,
        “ping”: “pong”
    }

    192.168.1.111 | success >> {
	    “changed”: false,
        “ping”: “pong”
    }

...

### Playbooks
