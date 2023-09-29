#!/bin/bash

# Login to Docker Hub
echo "Logging in to Docker Hub..."
docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD"

# Build the docker image 
docker build -t "$DOCKERHUB_REPO:$IMAGE_TAG" .

# Tag the image
docker tag "$DOCKERHUB_REPO:$IMAGE_TAG" "$DOCKER_USERNAME/$DOCKERHUB_REPO:$IMAGE_TAG"

# Push the image to Docker Hub
echo "Pushing the image to Docker Hub..."
docker push "$DOCKER_USERNAME/$DOCKERHUB_REPO:$IMAGE_TAG"

# Logout from Docker Hub
echo "Logging out from Docker Hub..."
docker logout

# Cleanup
docker rmi "$DOCKER_USERNAME/$DOCKERHUB_REPO:$IMAGE_TAG"