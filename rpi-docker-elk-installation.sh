#!/bin/bash
#rpi-docker-elk stack scripted installation
#Installing required packages
sudo apt-get update
sudo apt-get install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     python-software-properties

#Adding Docker's official GPG key
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add -

#Setup stable repository
echo "deb [arch=armhf] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
     $(lsb_release -cs) stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list

#Installing Docker
sudo apt-get update
sudo apt-get install -y docker-ce

#Installing pip
sudo apt-get install -y python-software-properties

#Installing Docker compose
sudo pip install docker-compose

#Starting ELK stack
docker-compose up