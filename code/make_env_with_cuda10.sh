#!/bin/sh

env_name=$1
envs_path=$2

conda create --name $env_name

scripts_path=$envs_path/$env_name/etc/conda

# Scripts under this folder are run whenever conda environment is activated
mkdir -p "$scripts_path/activate.d"
touch "$scripts_path/activate.d/activate.sh"

echo """#!/bin/sh
ORIGINAL_LD_LIBRARY_PATH=\$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/cuda-10/lib64:/usr/local/cuda-10/extras/CUPTI/lib64:\$LD_LIBRARY_PATH""" >> "$scripts_path/activate.d/activate.sh"


#(in the tutorial he also includes /lib/nccl/cuda-9 as a path but i dont have it)
#(in the tutorial he also includes $LD_LIBRARY_PATH in the path but mine is not empty so i dont use it)


# Scripts under this folder are run whenever conda environment is deactivated
mkdir -p "$scripts_path/deactivate.d"
touch "$scripts_path/deactivate.d/deactivate.sh"

echo """#!/bin/sh
export LD_LIBRARY_PATH=\$ORIGINAL_LD_LIBRARY_PATH
unset ORIGINAL_LD_LIBRARY_PATH""" >> "$scripts_path/deactivate.d/deactivate.sh"
