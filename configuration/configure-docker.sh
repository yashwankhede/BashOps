#!/bin/bash

# Install Docker and Docker Compose
apt-get update
apt-get install -y docker.io docker-compose

# Add the current user to the Docker group
read -p "Enter username to add to the Docker group: " username
usermod -aG docker $username

# Enable and start Docker service
systemctl enable docker.service
systemctl start docker.service

# Configure Docker daemon to use systemd as the container runtime
echo '{"exec-opts": ["native.cgroupdriver=systemd"]}' > /etc/docker/daemon.json

# Restart Docker service to apply changes
systemctl restart docker.service

# Verify that Docker is running
docker run hello-world
