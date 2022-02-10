#!/bin/bash

echo "Removing any existing remainder of Docker Components"
sudo apt-get remove docker docker-engine docker.io containerd runc

echo "Installing needed dependencies"
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    curl -y

echo "Downloading Docker GPG Key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo "Adding Docker Ubuntu Repository"
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

echo "Updating repository data and installing Docker"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

echo "Installing Docker-Compose and making it executable"
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.6/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
