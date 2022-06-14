SHELL := /bin/bash # otherwise we can't use "source"

conda_dir=/home/christina/miniconda3

rm-OCNN:
	export PATH=${conda_dir}/bin/:$$PATH \
		&& conda env remove -n OCNN 

make-OCNN: rm-OCNN
	export PATH=${conda_dir}/bin/:$$PATH \
		&& sh create_conda_env_with_cuda.sh OCNN /home/graphicslab/anaconda3/envs/ 10.1 3.7

init-OCNN: make-OCNN
	export PATH=${conda_dir}/bin/:$$PATH \
		&& source activate OCNN \
		&& conda install -c anaconda tensorflow-gpu==1.14.0 \
		&& conda install -c conda-forge yacs tqdm \
		&& conda install gast==0.2.2 numpy==1.16.4

save-OCNN:
	export PATH=${conda_dir}/bin/:$$PATH \
		&& conda activate OCNN && conda env export > OCNN.yml


rm-TF_TORCH:
	export PATH=${conda_dir}/bin/:$$PATH \
		&& conda env remove -n TF_TORCH

make-TF_TORCH: rm-TF_TORCH
	export PATH=${conda_dir}/bin/:$$PATH \
		&& sh create_conda_env_with_cuda.sh TF_TORCH ${conda_dir}/envs/ 10.1 3.7

init-TF_TORCH: make-TF_TORCH
	export PATH=${conda_dir}/bin/:$$PATH \
		&& source activate TF_TORCH \
		&& conda install -c anaconda pytest scikit-image tensorflow-gpu==1.14.0 \
		&& conda install -c conda-forge yacs tqdm matplotlib \
		&& conda install -c intel scikit-learn \
		&& conda install gast==0.2.2 numpy==1.16.4 \
		&& conda install pytorch torchvision cudatoolkit=10.1 -c pytorch \
		&& conda install pandas \
		&& pip install tensorboard visdom

save-TF_TORCH:
	export PATH=${conda_dir}/bin/:$$PATH \
		&& conda activate TF_TORCH && conda env export > TF_TORCH.yml


rm-STYLE:
	export PATH=${conda_dir}/bin/:$$PATH \
		&& conda env remove -n STYLE

make-STYLE: rm-STYLE
	export PATH=${conda_dir}/bin/:$$PATH \
		&& sh create_conda_env_with_cuda.sh STYLE "${conda_dir}/envs/" 10.1 3.7

init-STYLE: make-STYLE
	export PATH=${conda_dir}/bin/:$$PATH \
		&& source activate STYLE \
		&& conda install pytorch torchvision cudatoolkit=10.1 -c pytorch \
		&& conda install -c conda-forge matplotlib tqdm \
		&& pip install tensorboard tensorboardX \
		&& conda install -c plotly plotly=4.12.0 \
		&& pip install visdom \
		&& conda install -c anaconda pytest

save-STYLE:
	export PATH=${conda_dir}/bin/:$$PATH \
		&& conda activate STYLE && conda env export > STYLE.yml

