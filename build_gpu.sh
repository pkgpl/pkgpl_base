#!/usr/bin/sh 

IMAGE_NAME=pkgpl_gpu
IMAGE_TAG=0.2

docker build \
  --rm \
  --file Dockerfile.gpu \
  --tag $IMAGE_NAME:$IMAGE_TAG \
  ./
