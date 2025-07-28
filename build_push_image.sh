#!/bin/bash

# Konstanta
USERNAME="billiyagi"
REGISTRY="ghcr.io"
IMAGE_NAME="item-app"
TAG="v1"

# Build Docker image dengan nama lokal item-app:v1
docker build -t $IMAGE_NAME:$TAG .

# Lihat daftar image di lokal
docker images

# Tag image agar sesuai format GitHub Packages
docker tag $IMAGE_NAME:$TAG $REGISTRY/$USERNAME/$IMAGE_NAME:$TAG

# Login ke GitHub Container Registry (gunakan GITHUB_TOKEN dari environment)
echo $GITHUB_TOKEN | docker login $REGISTRY -u $USERNAME --password-stdin

# Push image ke GitHub Packages
docker push $REGISTRY/$USERNAME/$IMAGE_NAME:$TAG