SHELL := /bin/bash # otherwise we can't use "source"

rm-OCNN:
	conda env remove -n OCNN 

make-OCNN: rm-OCNN
	sh create_conda_env_with_cuda.sh OCNN /home/graphicslab/anaconda3/envs/ 10.1 3.7

init-OCNN: make-OCNN
	export PATH=/home/graphicslab/anaconda3/bin/:$$PATH \
		&& source activate OCNN \
		&& conda install -c anaconda tensorflow-gpu

save-OCNN:
	conda activate OCNN && conda env export > OCNN.yml
