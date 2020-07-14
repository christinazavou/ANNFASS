
remove-10.1:
	sh /home/christina/miniconda3/envs/mlcuda10/etc/conda/deactivate.d/deactivate.sh
	sh remove_env.sh mlcuda10.1

init-10.1: remove-10.1
	sh make_env.sh mlcuda10.1 /home/christina/miniconda3/envs 10.1
	export PATH=/home/christina/miniconda3/bin/:$$PATH && sh /home/christina/miniconda3/envs/mlcuda10.1/etc/conda/activate.d/activate.sh && conda install -c anaconda tensorflow-gpu

# note: makefile can't use "source" and "conda" ...
# note: in makefile each line is executed on a different shell! that's why we need to do:
# export PATH=/home/christina/miniconda3/bin/:$$PATH && echo $$PATH
#in one line rather than:
#export PATH=/home/christina/miniconda3/bin/:$$PATH
#echo $$PATH
#in two lines!!!