#!/usr/bin/sh 

IMAGE_NAME=pkgpl_cpu
IMAGE_TAG=0.2

docker build \
  --rm \
  --file Dockerfile.cpu \
  --tag $IMAGE_NAME:$IMAGE_TAG \
  ./
