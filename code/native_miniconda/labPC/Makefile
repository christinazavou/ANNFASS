# lab pc

SHELL := /bin/bash # otherwise we can't use "source"

rm-OCNN:
	conda env remove -n OCNN

init-OCNN: rm-OCNN
	sh make_env_for_tf.sh OCNN /home/graphicslab/miniconda3/envs 10.1 3.7
	source activate OCNN && conda install -c anaconda tensorflow-gpu==1.14.0 && conda install -c anaconda pytest

conda-update:
	conda update conda && conda update python && conda update --all

rm-tf-gpu:
	conda env remove -n tf-gpu

init-tf-gpu: rm-tf-gpu
	conda create --name tf-gpu && source activate tf-gpu && conda install tensorflow-gpu

rm-tf1-gpu:
	conda env remove -n tf1-gpu

init-tf1-gpu: rm-tf1-gpu
	conda create --name tf1-gpu && source activate tf1-gpu && conda install tensorflow-gpu==1.15
