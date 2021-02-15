docker login

LOCAL_CPU=pkgpl_cpu:0.2
LOCAL_GPU=pkgpl_gpu:0.2

TAG_CPU=0.20-cpu-horovod0.20.0-su-rsf
TAG_GPU=0.20-gpu-horovod0.20.0-su-rsf

docker tag $LOCAL_CPU plusha/pkgpl_base:$TAG_CPU
docker push plusha/pkgpl_base:$TAG_CPU

docker tag $LOCAL_GPU plusha/pkgpl_base:$TAG_GPU
docker push plusha/pkgpl_base:$TAG_GPU

docker logout
