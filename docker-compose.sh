#!/bin/sh
echo "Docker-Compose Installation"
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
echo "set the correct permissions so that the docker compose command is executable"
chmod +x ~/.docker/cli-plugins/docker-compose
echo "To verify that the installation was successful"
docker compose version