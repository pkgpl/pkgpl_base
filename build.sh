#!/bin/sh 

source ./Env.sh

if [ $DEVICE == "gpu" ]; then
    DOCKERFROM=$GPU_FROM
    TAG=$TAG_GPU
else
    DOCKERFROM=$CPU_FROM
    TAG=$TAG_CPU
fi

docker build \
  --rm \
  --build-arg dockerfrom=$DOCKERFROM \
  --file Dockerfile \
  --tag $REPOSITORY:$TAG \
  ./
