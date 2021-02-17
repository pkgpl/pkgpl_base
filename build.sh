#!/bin/sh 

source ./Env.sh

if [ $# -gt 0 ] && [ $1 == "-h" ]; then
    echo "Run Container: $PROJECT_NAME"
    echo "$0 [argument]"
    echo "  no argument: docker build without cache"
    echo "  -c:          docker build with cache"
    exit 0
fi

if [ $DEVICE == "gpu" ]; then
    DOCKERFROM=$GPU_FROM
    TAG=$TAG_GPU
else
    DOCKERFROM=$CPU_FROM
    TAG=$TAG_CPU
fi

if [ $# == 0 ]; then
    CACHE="--no-cache"
else
    case $1 in
        -c)
            CACHE=""
            ;;
        *)
            echo ""
            echo "Error: Wrong argument"
            exit 1
            ;;
    esac
fi

echo "Build image: $REPOSITORY:$TAG"
docker build \
  --rm \
  $CACHE \
  --build-arg dockerfrom=$DOCKERFROM \
  --file Dockerfile \
  --tag $REPOSITORY:$TAG \
  ./
