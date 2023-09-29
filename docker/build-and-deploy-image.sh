#!/bin/bash

# Access variables from Terraform environment
DOCKERHUB_USERNAME="${DOCKERHUB_USERNAME}"
DOCKERHUB_PASSWORD="${DOCKERHUB_PASSWORD}"
DOCKERHUB_REPO="${DOCKERHUB_REPO}"
IMAGE_TAG="${IMAGE_TAG}"

# Login to Docker Hub
echo "Logging in to Docker Hub..."
echo $DOCKERHUB_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin

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