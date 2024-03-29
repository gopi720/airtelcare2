#!/bin/bash
apt update -y
apt install -y software-properties-common gnupg2 curl
curl https://apt.releases.hashicorp.com/gpg | gpg — dearmor > hashicorp.gpg
install -o root -g root -m 644 hashicorp.gpg /etc/apt/trusted.gpg.d/
apt-add-repository "deb [arch=$(dpkg — print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
apt update -y 
apt install -y terraform
terraform — version

