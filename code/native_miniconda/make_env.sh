#!/bin/sh

env_name=$1
envs_path=$2
cuda_version=$3

# if miniconda is not in the path (e.g. because we dont want it to be the default python) then "conda" is not a recognized command
export PATH=/home/christina/miniconda3/bin/:$PATH

conda create --name $env_name

scripts_path=$envs_path/$env_name/etc/conda

# Scripts under this folder are run whenever conda environment is activated
mkdir -p "$scripts_path/activate.d"
touch "$scripts_path/activate.d/activate.sh"

echo """#!/bin/sh
ORIGINAL_LD_LIBRARY_PATH=\$LD_LIBRARY_PATH
ORIGINAL_PATH=\$PATH
ORIGINAL_CUDA_DIR=\$CUDA_DIR
export LD_LIBRARY_PATH=/usr/local/cuda-$cuda_version/lib64:/usr/local/cuda-$cuda_version/extras/CUPTI/lib64:\$LD_LIBRARY_PATH
export PATH=\$PATH:/usr/local/cuda-$cuda_version/bin
export CUDADIR=/usr/local/cuda-$cuda_version""" >> "$scripts_path/activate.d/activate.sh"


# Scripts under this folder are run whenever conda environment is deactivated
mkdir -p "$scripts_path/deactivate.d"
touch "$scripts_path/deactivate.d/deactivate.sh"

echo """#!/bin/sh
export LD_LIBRARY_PATH=\$ORIGINAL_LD_LIBRARY_PATH
export PATH=\$ORIGINAL_PATH
export CUDA_DIR=\$ORIGINAL_CUDA_DIR
unset ORIGINAL_LD_LIBRARY_PATH
unset ORIGINAL_PATH
unset ORIGINAL_CUDA_DIR""" >> "$scripts_path/deactivate.d/deactivate.sh"
