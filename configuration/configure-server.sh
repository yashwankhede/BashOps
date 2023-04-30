#!/bin/bash

# Update package lists and install necessary packages
apt update
apt upgrade -y
apt install -y git curl wget

# Create a new user and add them to sudoers
read -p "Enter new username: " username
adduser $username
usermod -aG sudo $username

# Disable password authentication and enable key-based authentication
sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
service ssh restart

# Generate SSH keys for new user
su - $username -c "ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa"

# Clone server configuration files
su - $username -c "git clone https://github.com/your-username/server-config.git ~/server-config"

# Run setup scripts
su - $username -c "~/server-config/setup-nginx.sh"
su - $username -c "~/server-config/setup-firewall.sh"
su - $username -c "~/server-config/setup-database.sh"
