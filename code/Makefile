#run-jp-docker:
#    sudo docker run -it --rm --gpus all -v $(pwd)/myjupyternotebooks:/tf/myjupyternotebooks -p 8888:8888 tensorflow/tensorflow:2.2.0-gpu-jupyter

env-mlcuda10:
	sh make_env_with_cuda10.sh mlcuda10 /home/christina/miniconda3/envs

rm-mlcuda10:
	sh remove_env.sh mlcuda10

#conda install -c anaconda tensorflow-gpu
