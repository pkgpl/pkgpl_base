REPOSITORY=pkgpl/pkgpl_base

# DEVICE = gpu or cpu
DEVICE=cpu

# source
CPU_FROM=ubuntu:22.04

GPU_FROM_TF=nvcr.io/nvidia/tensorflow:23.03-tf2-py3
GPU_FROM_TORCH=nvcr.io/nvidia/pytorch:23.03-py3
GPU_FROM=$GPU_FROM_TORCH

# tag
TAG_GPU=torch23.03_gpu
TAG_CPU=ubuntu_22.04_torch2.0_cpu

# dockerfile
DOCKERFILE=Dockerfile.cpu_torch

