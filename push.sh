#!/bin/sh

source ./Env.sh

docker logout
docker login

docker push $REPOSITORY:$TAG_CPU
docker push $REPOSITORY:$TAG_GPU

docker logout
