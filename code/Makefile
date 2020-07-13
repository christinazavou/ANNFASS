#run-jp-docker:
#    sudo docker run -it --rm --gpus all -v $(pwd)/myjupyternotebooks:/tf/myjupyternotebooks -p 8888:8888 tensorflow/tensorflow:2.2.0-gpu-jupyter

rm-mlcuda10:
	sh /home/christina/miniconda3/envs/mlcuda10/etc/conda/deactivate.d/deactivate.sh
	sh remove_env.sh mlcuda10

env-mlcuda10: rm-mlcuda10
	sh make_env_with_cuda10.sh mlcuda10 /home/christina/miniconda3/envs
	source activate mlcuda10
	conda install -c anaconda tensorflow-gpu


#note: makefile can't use source and conda ...