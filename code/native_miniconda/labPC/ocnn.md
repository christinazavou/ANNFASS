1. I cloned the repo on ubuntu 16
2. I removed cmake and installed cmake version 3.18.0

3. I run
```
cd octree/external && git clone --recursive https://github.com/wang-ps/octree-ext.git
cd .. && mkdir build && cd build
```

4. installed cuda10.1 with
```
sudo sh cuda_10.1.105_418.39_linux.run --silent --toolkit --toolkitpath=/usr/local/cuda-10.1
```

5. Then I run
```
sh make_env_for_tf.sh OCNN /home/graphicslab/miniconda3/envs 10.1 3.7
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

5. I activated the python environment (which also sets cuda paths):
```
source activate OCNN
nvcc --version 
```
this showed:
```
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2019 NVIDIA Corporation
Built on Fri_Feb__8_19:08:17_PST_2019
Cuda compilation tools, release 10.1, V10.1.105
```
and on the laptop of ubuntu 18 it showed:
```
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2019 NVIDIA Corporation
Built on Sun_Jul_28_19:07:16_PDT_2019
Cuda compilation tools, release 10.1, V10.1.243
```

7. Back to O-CNN project (under /octree/build) I run
```
cmake ..  && cmake --build . --config Release
export PATH=`pwd`:$PATH
```

8. to use the tensorflow code i run the following (starting from octree/build and having OCNN environment activated): 
```commandline
conda install -c conda-forge yacs tqdm
cmake .. -DUSE_CUDA=ON && make
cd ../../tensorflow/libs
python build.py
```

i was getting some numpy warnings so i run
```commandline
conda install gast==0.2.2 numpy==1.16.4
```

9. Then in /tensorflow/script i run:
```
python ../data/cls_modelnet.py --run download_m40_points
python ../data/cls_modelnet.py --run m40_generate_octree_tfrecords

``` 
python run_cls.py --config configs/cls_octree.yaml
where cls_octree.yaml contains:

``` 
SOLVER:
  gpu: 0,
  logdir: logs/m40/0322_ocnn_octree
  run: train
  max_iter: 160000
  test_iter: 925
  test_every_iter: 100
  step_size: (400,)

DATA:
  train:
    dtype: octree
    distort: True
    depth: 5
    location: dataset/ModelNet40/m40_5_2_12_train_octree.tfrecords 
    batch_size: 2
    x_alias: data
  test: 
    dtype: octree
    distort: False
    depth: 5
    location: dataset/ModelNet40/m40_5_2_12_test_octree.tfrecords
    shuffle: 0
    batch_size: 2
    x_alias: data

MODEL:
  name: ocnn
  channel: 3
  nout: 40
  depth: 5

LOSS:
  num_class: 40
  weight_decay: 0.0005
```


Now it runs on laptop (tried with batch 2,4,8 and it's all fine). But on pc i get the alloc issue.
Other attributes of the pc:

    - gpu card GeForce GTX 1080 Ti

    - running command "free -h" gives:
                      total        used        free      shared  buff/cache   available
        Mem:            15G        4,5G        2,9G         91M        8,2G         10G
        Swap:          7,6G         33M        7,6G
        
Other attributes of the laptop:
    - gpu card GeForce GTX 1050
    
    - running command "free -h" gives:
                          total        used        free      shared  buff/cache   available
        Mem:            15G        6,1G        1,3G        223M        8,1G        8,9G
        Swap:           15G         51M         15G

