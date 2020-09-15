#!/bin/sh
cuda_version=$1
ORIGINAL_LD_LIBRARY_PATH=$LD_LIBRARY_PATH
ORIGINAL_PATH=$PATH
ORIGINAL_CUDA_DIR=$CUDA_DIR
export LD_LIBRARY_PATH=/usr/local/cuda-$cuda_version/lib64:/usr/local/cuda-$cuda_version/extras/CUPTI/lib64:\$LD_LIBRARY_PATH
export PATH=$PATH:/usr/local/cuda-$cuda_version/bin
export CUDADIR=/usr/local/cuda-$cuda_version
