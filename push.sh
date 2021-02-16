#!/bin/sh

source ./Env.sh

if [ $DEVICE == "gpu" ]; then
    TAG=$TAG_GPU
else
    TAG=$TAG_CPU
fi

docker logout
docker login

docker push $REPOSITORY:$TAG

docker logout
