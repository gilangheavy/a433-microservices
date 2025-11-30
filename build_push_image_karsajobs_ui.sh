#!/bin/bash

# Variabel (Sesuaikan username GitHub)
IMAGE_NAME="karsajobs-ui"
TAG="latest"
GITHUB_USER="gilangheavy"
GHCR_IMAGE="ghcr.io/$GITHUB_USER/$IMAGE_NAME:$TAG"

# 1. Build Image
echo "Building Docker Image..."
docker build -t $GHCR_IMAGE .

# 2. Login GHCR
echo "Logging in to GitHub Packages..."
echo $CR_PAT | docker login ghcr.io -u $GITHUB_USER --password-stdin

# 3. Push Image
echo "Pushing Image to GHCR..."
docker push $GHCR_IMAGE
