1. cloned the repo
2. removed cmake and installed the needed cmake version

3. run
```
cd octree/external && git clone --recursive https://github.com/wang-ps/octree-ext.git
cd .. && mkdir build && cd build
```

4. installed cuda10.0 with
```
sudo sh cuda_10.0.130_410.48_linux.run --silent --toolkit --toolkitpath=/usr/local/cuda-10.0
```

5. run
```
sh make_env_for_tf.sh OCNN /home/graphicslab/miniconda3/envs 10.0 3.7
source activate OCNN && conda install -c anaconda tensorflow-gpu==1.14.0 && conda install -c anaconda pytest
```
where make_env_for_tf.sh is:
```
#!/bin/sh

env_name=$1
envs_path=$2
cuda_version=$3
py_version=$4

conda create --name $env_name python=$py_version

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
```

5. activated the python environment with setting cuda paths:
```
source activate OCNN
nvcc --version 
```
this showed:
```
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2018 NVIDIA Corporation
Built on Sat_Aug_25_21:08:01_CDT_2018
Cuda compilation tools, release 10.0, V10.0.130
```

7. back to O-CNN project run
```
cmake ..  && cmake --build . --config Release
export PATH=`pwd`:$PATH
```
