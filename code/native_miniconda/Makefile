SHELL := /bin/bash # otherwise we can't use "source"

# note: in makefile each line is executed on a different shell! that's why we need to do:
# export PATH=/home/christina/miniconda3/bin/:$$PATH && echo $$PATH
#in one line rather than:
#export PATH=/home/christina/miniconda3/bin/:$$PATH
#echo $$PATH
#in two lines!!!

#rm-VCG1:
#	sh /home/christina/miniconda3/envs/VCG1/etc/conda/deactivate.d/deactivate.sh
#	sh remove_env.sh VCG1
rm-VCG1:
	export PATH=/home/christina/miniconda3/bin/:$$PATH && conda env remove -n VCG1

init-VCG1: rm-VCG1
	sh make_env_for_tf.sh VCG1 /home/christina/miniconda3/envs 10.1 3.8
	export PATH=/home/christina/miniconda3/bin/:$$PATH && source activate VCG1 && conda install -c anaconda tensorflow-gpu

save-VCG1:
	export PATH=/home/christina/miniconda3/bin/:$$PATH && source activate VCG1 && conda env export > VCG1.yml

rm-VCG2:
	export PATH=/home/christina/miniconda3/bin/:$$PATH && conda env remove -n VCG2

init-VCG2: rm-VCG2
	sh make_env_for_pytorch.sh VCG2 10.1 3.8
	export PATH=/home/christina/miniconda3/bin/:$$PATH && source activate VCG2 && conda install pytorch torchvision cudatoolkit=10.1 -c pytorch
