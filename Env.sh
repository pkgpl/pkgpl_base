REPOSITORY=pkgpl/pkgpl_base

# DEVICE = gpu or cpu
DEVICE=gpu

TAG_CPU=0.20-cpu-horovod0.20.0-su-rsf
TAG_GPU=0.20-gpu-horovod0.20.0-su-rsf

CPU_FROM=horovod/horovod:0.20.0-tf2.3.0-torch1.6.0-mxnet1.5.0-py3.7-cpu
GPU_FROM=horovod/horovod:0.20.0-tf2.3.0-torch1.6.0-mxnet1.6.0.post0-py3.7-cuda10.1
