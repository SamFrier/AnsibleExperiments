#!/bin/bash

sudo apt-get update
sudo apt-get install -y ansible vim
ssh-keygen -t rsa
ssh-agent bash
ssh-add ~/.ssh/id_rsa