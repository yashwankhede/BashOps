#!/bin/bash

# Define docker image details
docker_image="my-docker-image"
docker_tag="latest"

# Build docker image
echo "Building docker image..."
docker build -t "$docker_image:$docker_tag" .

# Push docker image to Docker Hub
echo "Pushing docker image to Docker Hub..."
docker push "$docker_image:$docker_tag"

# Stop and remove old container
echo "Stopping and removing old container..."
docker stop "$docker_image" || true
docker rm "$docker_image" || true

# Run new container
echo "Starting new container..."
docker run -d --name "$docker_image" -p 80:80 "$docker_image:$docker_tag"

echo "Deployment complete!"
