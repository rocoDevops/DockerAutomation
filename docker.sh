#!/bin/sh
#Docker Installation
if [ -x "$(command -v docker)" ]; then
   echo "Update docker"
else
   echo "Install docker"
   echo "Update the Packages"
   sudo apt update
   echo "prerequisite packages which let apt use packages over HTTPS"
   sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
   echo "add the GPG key for the official Docker repository to your system"
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
   echo "Add the Docker repository to APT sources"
   echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   echo "Update your existing list of packages again"
   sudo apt update
   echo "install Docker"
   sudo apt install docker-ce -y
   echo "add your username to the docker group:"
   sudo usermod -aG docker ${USER}
   printf '\nDocker installed successfully\n\n'
   printf 'Waiting for Docker to start...\n\n'
   sleep 5
fi