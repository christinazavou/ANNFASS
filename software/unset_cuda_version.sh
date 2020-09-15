#!/bin/sh
export LD_LIBRARY_PATH=$ORIGINAL_LD_LIBRARY_PATH
export PATH=$ORIGINAL_PATH
export PATH=$(echo $PATH | sed "s|/home/graphicslab/anaconda3/envs/$1/bin:|/home/graphicslab/anaconda3/bin:|g")
export CUDA_DIR=$ORIGINAL_CUDA_DIR
unset ORIGINAL_LD_LIBRARY_PATH
unset ORIGINAL_PATH
unset ORIGINAL_CUDA_DIR
