SHELL := /bin/bash # otherwise we can't use "source"

rm-OCNN:
	export PATH=/home/graphicslab/anaconda3/bin/:$$PATH \
		&& conda env remove -n OCNN 

make-OCNN: rm-OCNN
	export PATH=/home/graphicslab/anaconda3/bin/:$$PATH \
		&& sh create_conda_env_with_cuda.sh OCNN /home/graphicslab/anaconda3/envs/ 10.1 3.7

init-OCNN: make-OCNN
	export PATH=/home/graphicslab/anaconda3/bin/:$$PATH \
		&& source activate OCNN \
		&& conda install -c anaconda tensorflow-gpu==1.14.0 \
		&& conda install -c conda-forge yacs tqdm \
		&& conda install gast==0.2.2 numpy==1.16.4

save-OCNN:
	export PATH=/home/graphicslab/anaconda3/bin/:$$PATH \
		&& conda activate OCNN && conda env export > OCNN.yml


rm-OCNN2:
	export PATH=/home/graphicslab/anaconda3/bin/:$$PATH \
		&& conda env remove -n OCNN2

make-OCNN2: rm-OCNN2
	export PATH=/home/graphicslab/anaconda3/bin/:$$PATH \
		&& sh create_conda_env_with_cuda.sh OCNN2 /home/graphicslab/anaconda3/envs/ 10.2 3.7

init-OCNN2: make-OCNN2
	export PATH=/home/graphicslab/anaconda3/bin/:$$PATH \
		&& source activate OCNN2 \
		&& conda install -c anaconda tensorflow-gpu==1.14.0 \
		&& conda install -c conda-forge yacs tqdm \
		&& conda install gast==0.2.2 numpy==1.16.4

save-OCNN2:
	export PATH=/home/graphicslab/anaconda3/bin/:$$PATH \
		&& conda activate OCNN2 && conda env export > OCNN2.yml
