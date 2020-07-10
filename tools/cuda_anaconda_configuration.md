conda create --name tf_cu10
source activate tf_cu10
conda install -c anaconda tensorflow-gpu

the environment path is: /home/christina/miniconda3/envs/tf_cu10

_**we can write an executable script that will be executed by Anaconda each time when the environment is activated by user:**_

```commandline
mkdir -p /home/christina/miniconda3/envs/tf_cu10/etc/conda/activate.d
touch /home/christina/miniconda3/envs/tf_cu10/etc/conda/activate.d/activate.sh
vim /home/christina/miniconda3/envs/tf_cu10/etc/conda/activate.d/activate.sh
chmod +x /home/christina/miniconda3/envs/tf_cu10/etc/conda/activate.d/activate.sh
```

and in the script use:
```
#!/bin/sh
ORIGINAL_LD_LIBRARY_PATH=$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/cuda-10/lib64:/usr/local/cuda-10/extras/CUPTI/lib64:$LD_LIBRARY_PATH
```

(in the tutorial he also includes /lib/nccl/cuda-9 as a path but i dont have it)
(in the tutorial he also includes $LD_LIBRARY_PATH in the path but mine is not empty so i dont use it)

if you activate now the environment and do 
```commandline
echo $LD_LIBRARY_PATH
```
you see the new paths

Now we want to set LD_LIBRARY_PATH to the old value that it had before the environment was activated whenever we deactivate our environment:

```commandline
mkdir -p /home/christina/miniconda3/envs/tf_cu10/etc/conda/deactivate.d
touch /home/christina/miniconda3/envs/tf_cu10/etc/conda/deactivate.d/deactivate.sh
vim /home/christina/miniconda3/envs/tf_cu10/etc/conda/deactivate.d/deactivate.sh
chmod +x /home/christina/miniconda3/envs/tf_cu10/etc/conda/deactivate.d/deactivate.sh
``` 

and in the script use:

```bash
#!/bin/sh

export LD_LIBRARY_PATH=$ORIGINAL_LD_LIBRARY_PATH
unset ORIGINAL_LD_LIBRARY_PATH
```