#!/bin/bash

echo "Removing any existing remainder of Docker Components"
sudo apt-get update
sudo apt-get remove docker docker-engine docker.io containerd runc -y

echo "Installing needed dependencies"
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y 

echo "Downloading Docker GPG Key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "Adding Docker Ubuntu Repository"
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Updating repository data and installing Docker"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

echo "Installing Docker-Compose and making it executable"
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose