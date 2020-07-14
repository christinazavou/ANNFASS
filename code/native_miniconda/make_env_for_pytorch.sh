#!/bin/sh

env_name=$1
cuda_version=$2
py_version=$3

set_cuda() {
   v=$1
   export PATH=$PATH:/usr/local/cuda-$v/bin
   export CUDADIR=/usr/local/cuda-$v
   export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-$v/lib64
   nvcc --version
}

set_cuda 10.1 # note: if we switch shell (terminal) then we lose the link to cuda 10.1

# if miniconda is not in the path (e.g. because we dont want it to be the default python) then "conda" is not a recognized command
export PATH=/home/christina/miniconda3/bin/:$PATH

conda create --name $env_name python=$py_version
