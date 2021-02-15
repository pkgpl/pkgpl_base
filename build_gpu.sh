#!/bin/sh 

source ./Env.sh

docker build \
  --rm \
  --file Dockerfile.gpu \
  --tag $REPOSITORY:$TAG_GPU \
  ./
