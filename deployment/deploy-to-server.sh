#!/bin/bash

# Define server details
server_user="username"
server_address="example.com"
server_port=22
server_directory="/var/www/html"

# Define local files to be copied to server
local_files=(
    "index.html"
    "style.css"
    "script.js"
    "images/"
)

# Define remote directory to copy files to on server
remote_directory="$server_user@$server_address:$server_directory"

# Copy files to server
echo "Deploying files to server..."
for file in "${local_files[@]}"; do
    if [[ -d "$file" ]]; then
        rsync -avz -e "ssh -p $server_port" "$file" "$remote_directory/${file%/}/"
    else
        rsync -avz -e "ssh -p $server_port" "$file" "$remote_directory"
    fi
done

echo "Deployment complete!"
