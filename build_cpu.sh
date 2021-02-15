#!/bin/sh 

source ./Env.sh

docker build \
  --rm \
  --file Dockerfile.cpu \
  --tag $REPOSITORY:$TAG_CPU \
  ./
