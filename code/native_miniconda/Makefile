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
	sh make_env.sh VCG1 /home/christina/miniconda3/envs 10.1 3.8
	export PATH=/home/christina/miniconda3/bin/:$$PATH && source activate VCG1 && conda install -c anaconda tensorflow-gpu

save-VCG1:
	export PATH=/home/christina/miniconda3/bin/:$$PATH && source activate VCG1 && conda env export > VCG1.yml


# note: for this one we need older driver
#remove-cu8py2_7tf1_01:
#	sh /home/christina/miniconda3/envs/mlcuda10/etc/conda/deactivate.d/deactivate.sh
#	sh remove_env.sh cu8py2_7tf1_01
#
#init-cu8py2_7tf1_01: rm-cu8py2_7tf1_01
#	sh make_env.sh cu8py2_7tf1_01 /home/christina/miniconda3/envs 8 2.7
#	export PATH=/home/christina/miniconda3/bin/:$$PATH && source activate cu8py2_7tf1_01 && conda install -c anaconda tensorflow-gpu
#
#save-env:
#	export PATH=/home/christina/miniconda3/bin/:$$PATH && source activate cu8py2_7tf1_01 && conda env export > VCG1.yml
